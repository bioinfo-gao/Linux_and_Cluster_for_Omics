#!/bin/bash
# stream editor (NO file needed , not need to save to file)
# print 2nd line 
# sed '2p'  student.txt 


#sed -n '2p'  student.txt 
#df -h | sed -n '2p' # Vim doesn't work for data stream
# sed '2,3d'  student.txt 
sed '2a hello'  student.txt # appned
sed '2i world'  student.txt # insert 
sed '2c goood'  student.txt # replace  
sed '2s/100/99/g'  student.txt # field replace  
#sed -i '2s/100/99/g'  student.txt # field replace and save the changed file ======= Change use vim is much safe 
#sed -e  "" ; "" # allow more opertaion together
# 
