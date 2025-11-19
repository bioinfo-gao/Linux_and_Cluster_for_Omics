#!/bin/bash
read -p "Enter a password: " pass
echo 
if test -z $pass 
then
    echo "No password was entered!!! Cannot verify an empty password!!!"	
    exit 1
fi
if test "$pass" = "jerry" # both "==" and "=" ok here 
then
     echo "Password verified."
fi
if test "$pass" != "jerry"
then
    echo "Wrong password!"
fi
