#!/bin/bash

NUM1=100
NUM2="naren"
SUM=$(($NUM1+NUM2))

echo "sum is : $SUM"

#arrays

FRUITS=("Apple" "Banana" "Pomo")

echo "Fruits are: ${FRUITS[@]}
echo "First Fruit is : ${FRUITS[0]}
echo "Second Fruit is : ${FRUITS[1]}
eccho "Third Fruit is : ${FRUITS[2]}