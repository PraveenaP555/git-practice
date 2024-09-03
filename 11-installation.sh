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
    dnf install git -y
else
    echo "git is already installed"
fi
