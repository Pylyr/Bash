#!/bin/bash
cd /Users/markdaychman/Desktop/

echo "Type the max number"
read num

array=($(seq 1 1 $num)) # Create an array of varibles from 1 to our limit

for ((a=0; a < num; a++))
do
array[a]=1
done

unset array[0] #We don't want 0 and 1 in our prime list
unset array[1]

lim=$(echo "sqrt($num)"| bc -l) # Those 2 lines are responsible for setting the limit for varible div
lim=$(echo "${lim%.*}") # As there is no necessity to check all possible div's only sqrt(num)
lim=$(($lim+1))

div=2

div_lim=$(($num/$div))
for ((i=2; i <= div_lim; i++))
do
k=$(($i*$div))
unset array[k]
done


for (( div=3; div < lim ; div=$div+2))
do
div_lim=$(($num/$div))
for ((i=2; i <= div_lim; i++))
do
k=$(($i*$div))
unset array[k]
done

done

echo "${!array[*]}"
echo "Script worked for $SECONDS seconds"
echo "     "
echo "     "
echo "     "
