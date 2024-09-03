#!/bin/bash

USERID=$(id -u)
echo "user id is: $USERID"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 failed"
        exit 1
    else
        echo "$2 success"
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


dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "mysql is already installed"
fi