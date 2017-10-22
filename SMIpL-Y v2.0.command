#!/bin/bash
cd /Users/markdaychman/Desktop/

echo "Type max number"
read n
clear
array=($(seq 1 1 $n))

lim=$(echo "sqrt($n)"| bc -l)
lim=$(echo "${lim%.*}")
lim=$(($lim+1))


for ((a=0; a < n; a++))
do
array[a]=1
done

unset array[0]
array[1]=0


k_lim=$(($n/2))
for (( k=2;k < k_lim; k++))
do
a=$((2*k))
unset array[$a]
done

m=3

while [[ "$m" -lt "$lim" ]]
do

if [[ "$array[m]" != "0" ]]
then
j=$(($m*2))

while [[ "$j" -lt "$n" ]]
do
unset array[$j]
j=$(($j+$m))
done

m=$(($m+1))
else
m=$(($m+1))
fi

done

echo "${!array[*]}" 
echo "Script worked for $SECONDS seconds"
