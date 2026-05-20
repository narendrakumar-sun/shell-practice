#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   
   echo " please run the script in root user"
   exit 1
fi

echo "instale nginix"
dnf install nginx -y

if [ $? -ne 0 ]; then
  
   echo " installing NGINX ..... FAILURE"
   exit 1
else
  
   echo " installing NGINX ..... SUCESS"

fi
