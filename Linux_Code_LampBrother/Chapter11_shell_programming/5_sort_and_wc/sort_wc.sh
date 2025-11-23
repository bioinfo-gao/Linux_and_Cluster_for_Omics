#!/bin/bash
cat ../data/student.txt
sort ../data/student.txt
sort -r  ../data/student.txt # reverse
# -f ignore case

sort /etc/passwd

# use 3rd items for ranking
# alphabettal ranking as a string
sort -t ':' -k 3,3 /etc/passwd  

# use 3rd items for ranking
# '-n' for numeriical ranking
sort -n -t ':' -k 3,3 /etc/passwd



wc  
wc -l 
wc -w
wc -m

df -h |wc 