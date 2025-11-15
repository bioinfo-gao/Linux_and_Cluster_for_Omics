#!/bin/bash
sort student.txt
sort -r student.txt # reverse
sort /etc/passwd
# use 3rd items for ranking
# alphabettal ranking as a string
sort -t ':' -k 3,3 /etc/passwd  
# use 3rd items for ranking
# '-n' for numeriical ranking
sort -n -t ':' -k 3,3 /etc/passwd

# -f ignore case

