#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"


mkdir -p $LOGS_FOLDER

USERID=$(id -u)
echo "user id is: $USERID" &>>$LOG_FILE

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is $G success $N" &>>$LOG_FILE
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "$R please run the script with root priveleges $N" &>>$LOG_FILE
        exit 1
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then    
        echo "$package not installed...going to install it" &>>$LOG_FILE
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$Y package is already installed $N" &>>$LOG_FILE
    fi
done