#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell_scripting"
LOG_FILE="/var/log/shell_scriping/$0.log"

if [ $USERID -ne 0 ]; then 
   echo " Please run the script in Root User " | tee -a $LOG_FILE
   exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo " $2 ....... FAILURE" | tee -a $LOG_FILE
      exit 1
    else
      echo " $2 ...... SUCESS"  | tee -a $LOG_FILE
    fi

}

for package in $@
do
 
   dnf list installed $package &>>$LOG_FILE

   if [ $? -ne 0 ]; then
      echo " $package not installed "  
      dnf install $package -y  | tee -a $LOG_FILE
      VALIDATE $? " Installing $package"

    else 
      echo "$package already installed"  
    fi
done