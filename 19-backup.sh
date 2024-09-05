#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
NO_OF_DAYS=${3:-14} #if $3 is empty, default is 14 days

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi