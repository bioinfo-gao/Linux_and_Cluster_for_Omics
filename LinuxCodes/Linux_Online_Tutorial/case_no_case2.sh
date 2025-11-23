#!/bin/bash
# A shell script to backup mysql, webserver and files to tape
opt=$1

#########################################################
# Use regex to match all command line arguments         #
# [Tt][Aa][Rr] matches "tar", "TAR", "taR", "TaR", etc  #
# [Ss][Qq][Ll] matches "sql", "SQL", "SQl", "SqL", etc  #
#########################################################
case $opt in
        [Ss][Qq][Ll])
             echo "Running mysql backup using mysqldump tool..."
             ;;
        [Ss][Yy][Nn][Cc])
             echo "Running backup using rsync tool..."
                 ;;
        [Tt][Aa][Rr])
             echo "Running tape backup using tar tool..."
                 ;;
         *)
             echo "Backup shell script utility"
             echo "Usage: $0 {sql|sync|tar}"
             echo "  sql  : Run mySQL backup utility."
             echo "  sync : Run web server backup utility."  
             echo "  tar  : Run tape backup utilty." ;;
esac
       

