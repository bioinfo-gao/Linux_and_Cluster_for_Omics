#!/bin/bash
field=./quoting
while IFS= read -r line
do
        # echo line is stored in $line
	echo $line
done < "$file"
