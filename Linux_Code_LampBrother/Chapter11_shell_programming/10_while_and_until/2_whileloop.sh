#!/bin/bash
# set n to 1
n=1
s=0 
# continue until $n equals 5
while [ $n -le 5 ]
do
	s=$(( s+n  ))    # s n , $s, $n 均可 
	n=$(( n+1 ))	 # increments $n
done

echo $s