#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell_script"
LOG_FILE="/var/log/shell_script/$0.log"

if [ $USERID -ne 0 ]; then
   echo "Please enter the script in root user"
   exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo " $2 ..... FAILURE " | tee -a $LOG_FILE
       exit 1
    else
       echo " $2 ...... SUCCESS" | tee -a $LOG_FILE
    fi
}
 for package in $@
 
 do 
   dnf install $package -y
   VALIDATE $? " installing $package "
done 