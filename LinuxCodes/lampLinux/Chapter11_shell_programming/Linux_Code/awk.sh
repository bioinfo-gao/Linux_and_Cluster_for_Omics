#!/bin/bash
# Please use print  NOT printf
#awk '{printf $2 "\t" $4 "\t" $6 "\n" }' df_info.txt
#awk '{printf $2 "\t" $4 "\t" $5 "%\t" $6 "\n" }' df_info.txt

#awk '{printf $2 "\t" $4 "\t" $5 "%\t" $6 "\n" }' df_info.txt #=====================
#df -h | awk '{printf $2 "\t" $4 "\t" $5 "%\t" $6 "\n" }' 



#df -h | awk '{print $2 "\t" $4 "\t" $5 "\t" $6  }' # print is better than printf, no \n needed
df -h | grep sda | awk '{print $5  }' | cut -d "%" -f 1 # print is better than printf, no \n needed
# printf %ni
# printf %m.nf