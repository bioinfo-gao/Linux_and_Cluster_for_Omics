

cd tmp
ll
cat file.txt
less /etc/inittab


tar -cvf tmp2_ZG.tar tmp2_ZG # creat tar 

mkdir tmp2_ZG

#=== workfor Both dir And file , Both WINdows And Linux
zip tmp2_ZG.zip tmp2_ZG 
unzip tmp2_ZG.zip  


# keep the orinigal file with -k 
bzip2 -k testfile  # 
bzip2 tmp2_ZG  # bzip2: Input file tmp2_ZG is a directory.
bunzip2 tmp2_ZG.bz2  # bzip2: Input file tmp2_ZG is a directory. -k keep the bz2 file

tar -cvf tmp2_ZG.tar tmp2_ZG # creat tar 
gzip   tmp2_ZG.tar
tar -zcf tmp3_ZG.tar.gz tmp3_ZG  # create tar and make gz
tar -zxf tmp3_ZG.tar.gz 

tar -jcf tmp3_ZG.tar.gz tmp3_ZG  # create tar and make gz
tar -jxf tmp3_ZG.tar.gz  # open the tar

