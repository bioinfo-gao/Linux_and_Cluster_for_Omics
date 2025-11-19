#!/bin/bash
read -p "Enter a number : " n
if test ( $n > 0 ); then
  echo "$n is a positive."
elif test ( $n < 0 )
then
  echo "$n is a negative."
elif test ( $n  == 0 )
then
  echo "$n is zero number."
else
  echo "Oops! $n is not a number."
fi
