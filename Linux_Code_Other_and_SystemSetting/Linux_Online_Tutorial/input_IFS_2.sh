#!/bin/bash
# input pizza names as commnad line arguments
IFS=", "
echo "* Displaying all pizza names using \$@"
echo "$@"
echo "the total arguments number is $#"
echo "the process number of the current shell is $$"
echo "$#"
 
echo "* Displaying all pizza names using \$*"
echo "$*"
