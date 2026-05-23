#!/bin/bash

set -e
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND"' ERR
USERID=$(id -u)
LOG_FOLDER="/var/log/shell_script"
LOG_FILE="$LOG_FOLDER/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
   echo -e " $R Please run the script in ROOT user $N"  | tee -a $LOG_FILE
   exit 1
fi
mkdir -p $LOG_FOLDER

for package in $@
do 
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]; then
     echo " $package not installed intalling now"
     dnf install $package -y &>>$LOG_FILE
  else
    echo -e "$package already installed $G SKIPING $N"
  fi
done
      