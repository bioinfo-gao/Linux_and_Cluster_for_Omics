#G!/bin/bash
awk '{print $1 "\t" $3}' student.txt
echo "-----"
awk '{printf $1 "\t" $3 "\n"}' student.txt
echo "-----"
awk 'BEGIN{print "The tile"} {print $1 "\t" $3}' student.txt
echo "-----"
# FS : for the internal spacer 
# read the 1st, then processing
awk '{FS=":"}{print $1 "\t" $3}' /etc/passwd
echo "-----"
# define spacer first, then read the 1st line
awk 'BEGIN{FS=":"}{print $1 "\t" $3}' /etc/passwd
echo "-----"
awk 'END{print "The information end"}{print $1 "\t" $3}' /etc/passwd
echo "-----"
cat /etc/passwd | grep "/bin/bash" | awk 'BEGIN {FS=":"}{print $1 "\t" $3}'
echo "-----"
cat student.txt | grep -v ID | awk '$3>=87 {print $1 "\t" $3}'

