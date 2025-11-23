#!/bin/bash
# cut cut table default by tab, other while should be specified with -d ":"
# not good for blank space " " Kong Ge, only by awk
cat /etc/passwd | grep /bin/bash | grep -v root | cut -d":" -f 1