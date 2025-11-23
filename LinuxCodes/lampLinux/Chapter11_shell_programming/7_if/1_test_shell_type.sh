#!/bin/sh
if [ "$SHELL" = "/bin/bash" ]; then
echo "your login shell is the bash (bourne again shell)"
else
echo "your login shell is not bash but $SHELL"
fi

# if ; then  在一行中需要加； 
# if  
# then 分成两行，不需要；