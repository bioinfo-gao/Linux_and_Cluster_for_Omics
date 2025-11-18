.gz  gzip
.tar tar -cf -xf
.tar.gz tar -zcf -zxf
.tar.bz2 tar -jcf -jxf



# regular compressed format
.gz  .zip .rar  # only .zip crossplatform

# cd tmp
# ll

touch boduo
cp file.txt file1.txt
cp inittab inittab1 

gzip boduo
gzip services3
ll                   # 5 fold compress 
gunzip services3.gz  # same as : gzip  -d services3.gz 

# gzip works for file only, NOT folder
mkdir -p Japan/boduo Japan/cangjing Japan/longze
gzip Japan # gzip: Japan is a directory -- ignored


# tar 打包 可以同时压缩
tar -cvf Japan.tar Japan # creat tar 
gzip Japan.tar           # compress      
tar -zcvf Japan1.tar.gz Japan # creat tar  and compress


# 解包解压缩
mv Japan Japan.bak
tar -xvf Japan1.tar.gz 

# compress ratio simiar as gzip 
#=== zip workfor Both dir And file , Both WINdows And Linux
cp -r Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/tmp/tmp2_ZG/ .
# mkdir tmp2_ZG
cp services ./tmp2_ZG
# sudo dnf install zip
zip services.zip services # compress file
zip -r tmp2_ZG.zip tmp2_ZG # -r for folder 
zip tmp3_ZG.zip tmp3_ZG
mv tmp2_ZG  ./tmp/tmp22_ZG 
unzip tmp2_ZG.zip     # both file and foder  


sudo dnf install bzip2
# keep the orinigal file with -k 
cp file.txt testfile
bzip2 -k testfile  # keep the raw file 
bzip2 tmp2_ZG  # bzip2: Input file tmp2_ZG is a directory.
bunzip2 tmp2_ZG.bz2  # bzip2: Input file tmp2_ZG is a directory. -k keep the bz2 file
bunzip2 -k tmp2_ZG.bz2  # bzip2: Input file tmp2_ZG is a directory. -k keep the bz2 file

tar -cjf tmp2_ZG.bz2 tmp2_ZG 
tar -xjf tmp2_ZG.bz2 