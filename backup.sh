#!/bin/bash 

source config.cfg       # loading the variable name of config.cfg file !!!!!!!!

Timestamp=$(date "+Y%m%d_%H%M%S")   # this is used to get the unique file name brother !!!! 


Archive_File_name="backup-$Timestamp.tar.gz"   # now you get the backup file name alway 



# This is the path where all the file location and the what log file name i have to create it !!! 


Log_files="$LOG_DIR/backup-$Timestamp.log"

# for the safe case create the destination and the log files if they cannot exits


#  -p for :) for ignoring the error if they exist brother   !!!!!


mkdir -p    "$Destination_directory"     "$LOG_DIR"



#  -czf ke  bad lekho ho brother $DEST_DIR es  directory ke andar jao uske badd ARCHIVE_NAME" ye jo variable banaya hai maine naming ke liye uksa help se name bna lo  esak matlb yahi hua na brother uske badd -C change the directory and than destination folder main ao uske baddd .  (. ---> select all the file and the folders brother !!!   )


tar -czf "$Destination_directory/$Archive_File_name"   -C "$Source_directory"  . 



# now brother maintain  a log files for the history !!!!! 


echo "[$(date)]"  Backup complete !!!    $Archive_File_name     >> "$Log_files" 





# now this is the code snippet  which is used to remove the remove the all file logs !!!!! 

echo "[$(date)] Deleting the Backups files older than 7 days  " >> "$Log_files"   2>&1

for file in "$Destination_directory"/*          # iterate over the full files 
do 
    # now check the file is older than 7 days or not !! 
   
    if [ -f "$file" ] && find "$file" -mtime +7 -print | grep -q .; then
        rm "$file" && echo "Deleted $file" >> "$Log_files"
    fi
done 






