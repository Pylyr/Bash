#!/bin/bash
echo "Enter a number:"
read num
until [[ "$num" = "1" ]]
do
a=$(echo "$num%2" |bc)
if [[ "$a" = "1" ]]
then
num=$(echo "$num*3" |bc)
num=$(echo "$num+1" |bc)
else
num=$(echo "$num/2" |bc)
fi
echo "$num"
done
#echo "Goes to 1 :("
