#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


if [ -d $SOURCE_DIR ] 
then    
    echo -e "$SOURCE_DIR $G exists $N"
else
    echo -e "$SOURCE_DIR $R does not exists $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files: $FILES"

while IFS= read -r line #IFS,internal filed seperator, empty it iwll ignore white spaces,-r is for not to ignore special characters liek /
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES