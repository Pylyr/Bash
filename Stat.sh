#!/bin/bash
reset
suit () {
suit=$(($1-1))
suit=$(($suit/13))
case $suit in
#Spades
0)
echo "1"
;;
#Clubs
1)
echo "2"
;;
#Hearts
2)
echo "3"
;;
3)
#Diamonds
echo "4"
;;
esac
}

value () {
value=$(($1+13))
value=$(($value%13))
case $value in
1)
echo "2"
;;
2)
echo "3"
;;
3)
echo "4"
;;
4)
echo "5"
;;
5)
echo "6"
;;
6)
echo "7"
;;
7)
echo "8"
;;
8)
echo "9"
;;
9)
echo "10"
;;
10)
echo "11"
;;
11)
echo "12"
;;
12)
echo "13"
;;
0)
echo "14"
esac
}
time=49
pair=0
tpairs=0
tok=0
strt=0
fl=0
fh=0
fok=0
sf=0
rf=0
hc=0
total=0
while :
do
generate_num=$(shuf -i 1-52 -n7)
for (( n=1; n < 8; n++ ))
do
array[n]=$(echo "$generate_num" | sed -n "$n"p)
done

#Custom cards
#array[1]=9
#array[2]=10
#array[3]=11
#array[4]=12
#array[5]=
#array[6]=
#array[7]=

for (( n=1; n < 8; n++ ))
do
for_var=${array[n]}
case $for_var in
1)
id[n]=1
;;
2)
id[n]=2
;;
3)
id[n]=3
;;
4)
id[n]=4
;;
5)
id[n]=5
;;
6)
id[n]=6
;;
7)
id[n]=7
;;
8)
id[n]=8
;;
9)
id[n]=9
;;
10)
id[n]=10
;;
11)
id[n]=11
;;
12)
id[n]=12
;;
13)
id[n]=13
;;
14)
id[n]=14
;;
15)
id[n]=15
;;
16)
id[n]=16
;;
17)
id[n]=17
;;
18)
id[n]=18
;;
19)
id[n]=19
;;
20)
id[n]=20
;;
21)
id[n]=21
;;
22)
id[n]=22
;;
23)
id[n]=23
;;
24)
id[n]=24
;;
25)
id[n]=25
;;
26)
id[n]=26
;;
27)
id[n]=27
;;
28)
id[n]=28
;;
29)
id[n]=29
;;
30)
id[n]=30
;;
31)
id[n]=31
;;
32)
id[n]=32
;;
33)
id[n]=33
;;
34)
id[n]=34
;;
35)
id[n]=35
;;
36)
id[n]=36
;;
37)
id[n]=37
;;
38)
id[n]=38
;;
39)
id[n]=39
;;
40)
id[n]=40
;;
41)
id[n]=41
;;
42)
id[n]=42
;;
43)
id[n]=43
;;
44)
id[n]=44
;;
45)
id[n]=45
;;
46)
id[n]=46
;;
47)
id[n]=47
;;
48)
id[n]=48
;;
49)
id[n]=49
;;
50)
id[n]=50
;;
51)
id[n]=51
;;
52)
id[n]=52

esac
done
combo=0
st_f=0
unset array
unset straight
unset s1
unset s2
p=0
total=$(($total+1))
j=1

for ((i=2; i<=7;i++))
do
for ((k=1; k<i;k++))
do
if [[ "$(value ${id[i]})" = "$(value ${id[k]})" ]]
then
if [[ "$s1" = "" || "$s1" = "$(value ${id[k]})" ]]
then
p=$(($p+1))
s1="$(value ${id[k]})"
j=0
elif [[ "$s2" = "$k" || "$j" = "0" ]]
then
p=$(($p+1))
s2="$(value ${id[k]})"
j=1
fi

fi
done
done


case $p in
1)
#A pair
combo=1
;;
2)
#Two pairs
combo=2
;;
3)
#Three of a kind
combo=3
;;
4)
#Full house
combo=6
;;
6)
#Four of a kind
combo=7

esac

#Straight
for ((i=1; i<=7; i++))
do
straight[i]=$(value ${id[i]})
done
str=$(sort -n <(printf "%s\n" "${straight[@]}"))
for ((i=1; i<=7; i++))
do
straight[i]=$(echo "$str" | sed -n "$i"p)
done
for ((a=5;a<=7;a++))
do
for ((b=4;b<a;b++))
do
for ((c=3;c<b;c++))
do
for ((d=2;d<c;d++))
do
for ((e=1;e<d;e++))
do

if [[ "${straight[a]}" = "$((${straight[b]}+1))" && "${straight[b]}" = "$((${straight[c]}+1))" && "${straight[c]}" = "$((${straight[d]}+1))" && "${straight[d]}" = "$((${straight[e]}+1))" ]]
then
combo=4
st_f=$(($st_f+1))
break 5
fi
done
done
done
done
done


#Flush
for ((a=5;a<=7;a++))
do
for ((b=4;b<a;b++))
do
for ((c=3;c<b;c++))
do
for ((d=2;d<c;d++))
do
for ((e=1;e<d;e++))
do

if [[ "$(suit ${id[e]})" = "$(suit ${id[e]})" && "$(suit ${id[e]})" = "$(suit ${id[d]})" && "$(suit ${id[d]})" = "$(suit ${id[c]})" && "$(suit ${id[c]})" = "$(suit ${id[b]})" && "$(suit ${id[b]})" = "$(suit ${id[a]})" ]]
then
var_1=$a
var_2=$b
var_3=$c
var_4=$d
var_5=$e
combo=5
st_f=$(($st_f+1))
break 5
fi

done
done
done
done
done

#Straight-Flush and Royal Flush
if [[ "$st_f" = "2" ]]
then
spec[1]=${id[var_1]}
spec[2]=${id[var_2]}
spec[3]=${id[var_3]}
spec[4]=${id[var_4]}
spec[5]=${id[var_5]}
spc=$(sort -n <(printf "%s\n" "${spec[@]}"))
for ((i=1; i<=5; i++))
do
spec[i]=$(echo "$spc" | sed -n "$i"p)
done

if [[ "$(value ${spec[5]})" = "$(($(value ${spec[4]})+1))" && "$(value ${spec[4]})" = "$(($(value ${spec[3]})+1))" && "$(value ${spec[3]})" = "$(($(value ${spec[2]})+1))" && "$(value ${spec[2]})" = "$(($(value ${spec[1]})+1))" ]]
then
if [[ "$(value ${spec[5]})" = "14" && "$(value ${spec[1]})" = "10" ]]
then
combo=9
else
combo=8
fi
fi
fi
#Higest card

case $combo in
1)
pair=$(($pair+1))
;;
2)
tpairs=$(($tpairs+1))
;;
3)
tok=$(($tok+1))
;;
4)
strt=$(($strt+1))
;;
5)
fl=$(($fl+1))
;;
6)
fh=$(($fh+1))
;;
7)
fok=$(($fok+1))
;;
8)
sf=$(($sf+1))
;;
9)
rf=$(($rf+1))
;;
0)
hc=$(($hc+1))
esac


if [[ "$time" = "49" ]]
then
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1
tput el
tput cuu1

hc_pro=$(echo "scale=5; $hc*100/$total"|bc)
pair_pro=$(echo "scale=5; $pair*100/$total"|bc)
tpairs_pro=$(echo "scale=5; $tpairs*100/$total"|bc)
tok_pro=$(echo "scale=5; $tok*100/$total"|bc)
strt_pro=$(echo "scale=5; $strt*100/$total"|bc)
fl_pro=$(echo "scale=5; $fl*100/$total"|bc)
fh_pro=$(echo "scale=5; $fh*100/$total"|bc)
fok_pro=$(echo "scale=5; $fok*100/$total"|bc)
sf_pro=$(echo "scale=5; $sf*100/$total"|bc)
rf_pro=$(echo "scale=5; $rf*100/$total"|bc)
speed=$(echo "scale=2; $total/$SECONDS"|bc)


echo "Highest card: $hc ("$hc_pro"%)
A pair: $pair ("$pair_pro"%)
Two pairs: $tpairs ("$tpairs_pro"%)
Three of a kind: $tok ("$tok_pro"%)
Straight: $strt ("$strt_pro"%)
Flush: $fl ("$fl_pro"%)
Full house: $fh ("$fh_pro"%)
Four of a kind: $fok ("$fok_pro"%)
Straight-flush: $sf ("$sf_pro"%)
Royal flush: $rf ("$rf_pro"%)
Total: $total
Time running: $SECONDS seconds
Average speed: $speed combinations per second"
time=0
else
time=$(($time+1))
fi
done
