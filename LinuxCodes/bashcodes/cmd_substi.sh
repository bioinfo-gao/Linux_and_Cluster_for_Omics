#!/usr/bin/bash
echo "Today is $(date)"
echo "another formart" `date`
echo "Computer name is $(hostname)"
NOW=$(date)
echo "$NOW"
echo "--------------"
for f in $(ls /etc/*.conf)
do
   echo "$f"
done
echo "--------------"
CWD=$(pwd)
cd /path/some/where/else
echo "Current dir $(pwd) and now going back to old dir .."
cd $CWD

