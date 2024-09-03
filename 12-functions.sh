#!/bin/bash

USERID=$(id -u)
echo "user id is: $USERID"


VALIDATE(){
 echo "exit status: $1"
}

if [ $USERID -ne 0 ]
then
    echo "please run the script with root priveleges"
    exit 1
fi
dnf list installed git

VALIDATE $?

# if [ $? -ne 0 ]
# then    
#     echo "git is not installed"
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then    
#         echo "git installation is not succes"
#         exit 1
#     else    
#         echo "git installation is success"
#     fi
# else
#     echo "git is already installed"
# fi


# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     echo "Mysql is not installed"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "mysql installation failed"
#         exit 1
#     else
#         echo "mysql installation is success"
#     fi
# else
#     echo "mysql is already installed"
# fi