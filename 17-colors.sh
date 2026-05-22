#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell_script"
LOG_FILE="/var/log/shell_script/$0.log"
R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

if [ $USERID -ne 0 ]; then
   echo " $R Please run the script in ROOT user $N"  | tee -a $LOG_FILE
   exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo "$2 ...... $R FAILURE $N"   | tee -a $LOG_FILE
       exit 1
    else
       echo " $2 ...... $G SUCCESS $N " | tee -a $LOG_FILE
    fi 
}

for package in $@
do
   dnf list installed $package
   
   if [ $? -ne 0 ]; then
      echo " $package not installed .. $G installing $N"
      dnf install $package -y
      VALIDATE $? "installing $package"
    else
      echo " $package already installed $Y skipping $N"
    fi
done