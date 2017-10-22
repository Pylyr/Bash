#!/usr/local/bin/bash
echo "2"
for (( number=3; ;number=$number+2))
do
status=1
lim=$(echo "scale=64; sqrt($number)" |bc -l)
lim=$(echo "${lim%.*}")
lim=$(($lim+1))

for (( div=3; div < lim; div=$div+2 ))
do
rem=$(echo "$((number%div))"|bc -l)

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
