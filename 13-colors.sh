#!/bin/bash

USERID=$(id -u)
echo "user id is: $USERID"

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N"
        exit 1
    else
        echo -e "$2 is $G success $N"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "please run the script with root priveleges"
        exit 1
    fi
}

CHECK_ROOT

dnf list installed git



if [ $? -ne 0 ]
then    
    echo "git is not installed"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "git is already installed"
fi


dnf list installed mysqlsss
if [ $? -ne 0 ]
then
    echo "Mysql is not installed"
    dnf install mysqlsss -y
    VALIDATE $? "Installing MySQL"
else
    echo "mysql is already installed"
fi