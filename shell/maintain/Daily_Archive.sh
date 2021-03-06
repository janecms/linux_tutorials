#!/bin/bash
#
#Daily_Archive - Archive designated files & directories
########################################################
#
# Gather Current Date
#
DATE=$(date +%y%m%d)
#
# Set Archive File Name
#
FILE=archive$DATE.tar.gz

#
# Set Configuration and Destination File
#
CONFIG_FILE=/archive/Files_To_Backup
DESTINATION=/archive/$FILE
#
######### Main Script #########################
#
# Check Backup Config file exists
#
# Make sure the config file still exists.
if [ -f $CONFIG_FILE ] 
# If it exists, do nothing but continue on.
then 
	echo
# If it doesn't exist, issue error & exit script.	
else 
echo
echo "$CONFIG_FILE does not exist."
echo "Backup not completed due to missing Configuration File"
echo
exit
fi


#
# Build the names of all the files to backup
#
# Start on Line 1 of Config File.
FILE_NO=1 
# Redirect Std Input to name of Config File
exec < $CONFIG_FILE 
#
read FILE_NAME # Read 1st record
# Create list of files to backup.
while [ $? -eq 0 ] 
do
# Make sure the file or directory exists.
if [ -f $FILE_NAME -o -d $FILE_NAME ]
then

# If file exists, add its name to the list.
FILE_LIST="$FILE_LIST $FILE_NAME"
else
# If file doesn't exist, issue warning

echo
echo "$FILE_NAME, does not exist."
echo "Obviously, I will not include it in this archive."
echo "It is listed on line $FILE_NO of the config file."
echo "Continuing to build archive list..."
echo
fi
#

# Increase Line/File number by one.
FILE_NO=$[$FILE_NO + 1]
# Read next record.
read FILE_NAME 
done

#
#######################################
#
# Backup the files and Compress Archive
#
echo "Starting archive..."
echo
#
tar -czf $DESTINATION $FILE_LIST 2> /dev/null
#
echo "Archive completed"
echo "Resulting archive file is: $DESTINATION"
echo
#
exit

