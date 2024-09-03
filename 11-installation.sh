#!/bin/bash

USERID=$(id -u)
echo "user id is: $USERID"
if [ $USERID -ne 0 ]
then
    echo "please run the script with root priveleges"
    exit 1
fi
dnf list installed git
if [ $? -ne 0 ]
then    
    echo "git is not installed"
    dnf install gittt -y
    if [ $? -ne 0 ]
    then    
        echo "git installation is not succes"
        exit 1
    else    
        echo "git installation is success"
    fi
else
    echo "git is already installed"
fi
