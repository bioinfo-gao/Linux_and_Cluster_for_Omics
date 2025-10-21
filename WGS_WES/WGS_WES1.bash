#!/bin/bash 
# This is a bash script to run WGS and WES analysis on a Linux cluster. 
# https://www.kimi.com/chat/cui4ls1djjppps7pg2gg

# Step 1: Prepare the environment
# Install the necessary software and tools
sudo apt-get update

# Example paths – change as needed
REF=$PWD/ref/GRCh38.p14.fa
BWA_INDEX=$REF
KNOWN_SITES=(                          # GATK bundle (hg38)
  ref/Homo_sapiens_assembly38.dbsnp138.vcf.gz
  ref/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz
)
THREADS=16

# Step 2: Download the data and reference files

conda create -n dna-seq -c bioconda -c conda-forge \
  bwa=0.7.18 samtools=1.20 gatk4=4.5.0 bcftools=1.20 \
  fastp=0.23.4 bedtools=2.31 picard=3.1.1
conda activate dna-seq

# Step 2.1: Download the reference genome 
# Project folder & sample sheet
mkdir project && cd project 
mkdir fastq && mkdir scripts && mkdir results
# project/          # Ctl + / to comment 
# ├── fastq/        # <sample>_R1.fastq.gz  <sample>_R2.fastq.gz
# ├── scripts/      # generated shell scripts
# └── results/      # aligned, gVCF, final VCF

# Step 2.2: Download the reference genome
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz
gunzip GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz
mv GCA_000001405.15_GRCh38_no_alt_analysis_set.fna ref/GRCh38.p14.fa 

# Step 2.3: Download the known sites for variant calling 
mkdir ref && cd ref 
for file in "${KNOWN_SITES[@]}"; do
  wget $file
done 
cd.. 
# Step 2.4: Download the sample data 
cd fastq 
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR116/008/SRR1167688/SRR1167688_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR116/008/SRR1167688/SRR1167688_2.fastq.gz

Create a TSV “sample.list” (no header)

sample1  fastq/sample1_R1.fastq.gz  fastq/sample1_R2.fastq.gz
sample2  fastq/sample2_R1.fastq.gz  fastq/sample2_R2.fastq.gz
sample3  fastq/sample3_R1.fastq.gz  fastq/sample3_R2.fastq.gz

# Step 3: Align the reads to the reference genome using BWA-MEM 

#!/usr/bin/env bash
set -euo pipefail

##########   CONFIG   ##########
REF=$PWD/ref/GRCh38.p14.fa
KNOWN_SITES=(ref/*.vcf.gz)
THREADS=16
TARGET=""                          # WGS: leave empty ; WES: /path/capture.bed
################################

#--- 1. FASTQ pre-processing (adapter/quality trimming) ---#
trim(){
  local sm=$1 r1=$2 r3=$3
  echo ">>> Trim  $sm"
  fastp -i "$r1" -I "$r3" -o results/"$sm"_trim_R1.fq.gz -O results/"$sm"_trim_R2.fq.gz \
        --detect_adapter_for_pe --qualified_quality_phred 20 --length_required 35 -h results/"$sm"_fastp.html
}

#--- 2. BWA-MEM alignment & sort ---#
align(){
  local sm=$1
  echo ">>> Align $sm"
  bwa mem -t $THREADS -Y -M $REF results/"$sm"_trim_R1.fq.gz results/"$sm"_trim_R2.fq.gz | \
  samtools sort -@ $THREADS -o results/"$sm".bam -
  samtools index -@ $THREADS results/"$sm".bam
}

#--- 3. Remove duplicates ---#
markdup(){
  local sm=$1
  echo ">>> MarkDup $sm"
  picard MarkDuplicates I=results/"$sm".bam O=results/"$sm"_md.bam M=results/"$sm"_md_metrics.txt \
       REMOVE_DUPLICATES=false ASSUME_SORT_ORDER=coordinate
  samtools index -@ $THREADS results/"$sm"_md.bam
}

#--- 4. Base Quality Score Recalibration (BQSR) ---#
bqsr(){
  local sm=$1
  echo ">>> BQSR $sm"
  gatk BaseRecalibrator -R $REF -I results/"$sm"_md.bam \
    --known-sites ${KNOWN_SITES[0]} --known-sites ${KNOWN_SITES[1]} \
    -O results/"$sm"_recal.table
  gatk ApplyBQSR -R $REF -I results/"$sm"_md.bam --bqsr-recal-file results/"$sm"_recal.table \
    -O results/"$sm"_recal.bam
  samtools index -@ $THREADS results/"$sm"_recal.bam
}

#--- 5. Variant calling (gVCF mode) ---#
gvcf(){
  local sm=$1
  echo ">>> gVCF $sm"
  extra=""
  [[ -n $TARGET ]] && extra="--intervals $TARGET"
  gatk HaplotypeCaller -R $REF -I results/"$sm"_recal.bam -O results/"$sm".g.vcf.gz \
    -ERC GVCF $extra
}

#--- 6. Joint genotyping & VQSR ---#
joint(){
  echo ">>> Joint genotyping"
  gatk GenomicsDBImport -R $REF $(ls results/*.g.vcf.gz | sed 's/^/-V /') \
     --genomicsdb-workspace-path gdb $([[ -n $TARGET ]] && echo "--intervals $TARGET")
  gatk GenotypeGVCFs -R $REF -V gendb://gdb -O results/cohort_raw.vcf.gz $([[ -n $TARGET ]] && echo "--intervals $TARGET")
  # SNP VQSR
  gatk VariantRecalibrator -R $REF -V results/cohort_raw.vcf.gz \
    --resource:hapmap,known=false,training=true,truth=true,prior=15.0 $KNOWN_SITES[0] \
    --resource:omni,known=false,training=true,truth=true,prior=12.0 $KNOWN_SITES[1] \
    -mode SNP -O results/VQSR_snps.recal -tranches-file results/VQSR_snps.tranches
  gatk ApplyVQSR -R $REF -V results/cohort_raw.vcf.gz \
    --recal-file results/VQSR_snps.recal --tranches-file results/VQSR_snps.tranches -mode SNP \
    -O results/cohort_snps_recal.vcf.gz
  # INDEL VQSR (same logic) omitted for brevity
  mv results/cohort_snps_recal.vcf.gz results/cohort_final.vcf.gz
  tabix -p vcf results/cohort_final.vcf.gz
}

##########   MAIN   ##########
mkdir -p results
while IFS=$'\t' read -r sample r1 r2; do
  trim  "$sample" "$r1" "$r2"
  align "$sample"
  markdup "$sample"
  bqsr   "$sample"
  gvcf   "$sample"
done < sample.list
joint
echo "=== Pipeline finished: results/cohort_final.vcf.gz ==="

# Step 4: Run the pipeline on the cluster 
chmod +x run_wgs_wes.sh
./run_wgs_wes.sh

# Step 4.1 WES-only tweak
# Supply the capture BED when you call the script:

TARGET=ref/SureSelect_Human_All_Exon_V8_hg38.bed ./run_wgs_wes.sh 