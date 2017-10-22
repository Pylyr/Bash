#!/bin/bash
cd /Users/markdaychman/Desktop/

echo "Type max number"
read n
clear
array=($(seq 1 1 $n))

for ((a=0; a < n; a++))
do
array[a]=1
done

unset array[0]
array[1]=0

m=2



while [[ "$m" -lt "$n" ]]
do

if [[ "$array[m]" != "0" ]]
then
j=$(($m*2))

while [[ "$j" -lt "$n" ]]
do
array[$j]=0
j=$(($j+$m))
done

m=$(($m+1))
else
m=$(($m+1))
fi

done

for (( i=2; i < n; i++))
do
if [[ "${array[$i]}" -eq "1" ]]
then
echo "$i"
fi
done


echo "Script worked for $SECONDS seconds"
