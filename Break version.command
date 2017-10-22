#!/usr/local/bin/bash

for (( number=2; ;number++))
do
status=1
lim=$(echo "scale=64; sqrt($number)" |bc -l)
lim=$(echo "${lim%.*}")
lim=$(($lim+1))
for (( div=2; div<lim; div++))
do
rem=$(echo "$(($number%$div))"|bc -l)

if [[ "$rem" == "0" ]]
then
status=0
break
fi

done

if [[ "$status" = "1" ]]
then
echo "$number"
fi

done


