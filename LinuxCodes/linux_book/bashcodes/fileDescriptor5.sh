#!/bin/bash
# Let us assign the file descriptor to file for input fd # 3 is Input file 
exec 3< output1.txt
 
# Let us assign the file descriptor to file for output fd # 3 is Input file 
exec 4> output2.txt
 
# Use read command to read first line of the file using fd # 3
read -u 3 line
 
# Display data on screen
echo "Data read from fd # 3:"
echo $line
 
# Write the same data to fd # 4 i.e. our output file
echo "Writing data read from fd #3 to fd#4 ... "
echo  "Field is------------- $line " >&4
 
# Close fd # 3 and # 4
exec 3<&-
exec 4<&-
