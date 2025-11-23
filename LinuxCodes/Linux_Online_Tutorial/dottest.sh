#!/bin/bash
# the bash *.sh method runs in subshell, the dot command. runs in current she# The dot command allows you to modify current shell variables
echo "In script before : $WWWJAIL"
WWWJAIL=/apache.jail
echo "In script after : $WWWJAIL"
