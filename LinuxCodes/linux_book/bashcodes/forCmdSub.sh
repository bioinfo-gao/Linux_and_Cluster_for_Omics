#!/bin/bash
echo "Printing file names in /tmp directory:"
for f in $(ls *.sh)
do
	echo $f
done
