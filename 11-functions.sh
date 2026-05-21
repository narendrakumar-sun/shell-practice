#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "please run the script in Root user"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo "$2 ..... FAILURE"
    else
       echo "$2 ..... SUCESS"
    fi
}

dnf install nginx -y 
VALIDATE $? "installing nginx"

dnf install mysql -y
VALIDATE $? "installing mysl"

dnf install nodejs -y
VALIDATE $? "installing nodejs"