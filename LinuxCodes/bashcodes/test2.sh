#!/bin/bash
read -p "Enter a password: " pass
if test "$pass" = "jerry" # both "==" and "=" ok here 
then
     echo "Password verified."
fi
