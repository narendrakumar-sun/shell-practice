#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]; then

   echo "Given number : $NUMBER greater then 20"

elif  [ $NUMBER -eq 20 ]; then

   echo "Given number : $NUMBER equal to 20"

else 

   echo "Given number : $NUMBER lessthen 20"

fi