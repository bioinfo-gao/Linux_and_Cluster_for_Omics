#!/bin/bash
# A shell script to backup mysql, webserver and files to tape
opt=$1
# Turn on a case-insensitive matching (-s set nocasematch)
shopt -s nocasematch
case $opt in
        sql)
                echo "Running mysql backup using mysqldump tool..."
                ;;
        sync)
                echo "Running backup using rsync tool..."
                ;;
        tar)
                echo "Running tape backup using tar tool..."
                ;;
        *)
        	    echo "Backup shell script utility"
                echo "Usage: $0 {sql|sync|tar}"
                echo "	sql  : Run mySQL backup utility."
                echo "	sync : Run web server backup utility."	
                echo "	tar  : Run tape backup utilty."	;;
esac
 
# Turn off a case-insensitive matching (-u unset nocasematch)
shopt -u nocasematch
