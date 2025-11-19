#!/bin/bash
# cut cut table default by tab, other while should be specified with -d ":"
# not good for blank space " " Kong Ge, only by awk
# printf %ns
# printf %ni # integer
# printf %m.nf # float pint number

# printf %s hello
# printf %s 1 2 3 4 5 6
# printf '%s %s %s' 1 2 3 4 5 6 # ''  or "" needed

printf '%s %s %s\n' 1 2 3 4 5 6 # \n needed for format

#printf '%s' $(cat df_info.txt)
printf '%s\t %s\t %s\t %s\t %s\t %s\n ' $(cat df_info.txt)

# printf %ni
# printf %m.nf