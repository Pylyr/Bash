#!/bin/bash
reset
suit () {
suit=$(($1/13))
case $suit in
0)
echo "Spades"
;;
1)
echo "Clubs"
;;
2)
echo "Hearts"
;;
3)
echo "Diamonds"
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
while :
do
generate_num=$(shuf -i 1-52 -n7)
for (( n=1; n < 8; n++ ))
do
array[n]=$(echo "$generate_num" | sed -n "$n"p)
done
#Custom cards
#9♣︎ 10♣︎ 8♣︎ 7♣︎ 5♣︎
#array[1]=1
#array[2]=14
#array[3]=27
#array[4]=40
#array[5]=
#array[6]=
#array[7]=
for (( n=1; n < 8; n++ ))
do
for_var=${array[n]}
case $for_var in
1)
card[n]=2♠︎
id[n]=1
;;
2)
card[n]=3♠︎
id[n]=2
;;
3)
card[n]=4♠︎
id[n]=3
;;
4)
card[n]=5♠︎
id[n]=4
;;
5)
card[n]=6♠︎
id[n]=5
;;
6)
card[n]=7♠︎
id[n]=6
;;
7)
card[n]=8♠︎
id[n]=7
;;
8)
card[n]=9♠︎
id[n]=8
;;
9)
card[n]=10♠︎
id[n]=9
;;
10)
card[n]=J♠︎
id[n]=10
;;
11)
card[n]=Q♠︎
id[n]=11
;;
12)
card[n]=K♠︎
id[n]=12
;;
13)
card[n]=A♠︎
id[n]=13
;;
14)
card[n]=2♣︎
id[n]=14
;;
15)
card[n]=3♣︎
id[n]=15
;;
16)
card[n]=4♣︎
id[n]=16
;;
17)
card[n]=5♣︎
id[n]=17
;;
18)
card[n]=6♣︎
id[n]=18
;;
19)
card[n]=7♣︎
id[n]=19
;;
20)
card[n]=8♣︎
id[n]=20
;;
21)
card[n]=9♣︎
id[n]=21
;;
22)
card[n]=10♣︎
id[n]=22
;;
23)
card[n]=J♣︎
id[n]=23
;;
24)
card[n]=Q♣︎
id[n]=24
;;
25)
card[n]=K♣︎
id[n]=25
;;
26)
card[n]=A♣︎
id[n]=26
;;
27)
card[n]=2♥︎
id[n]=27
;;
28)
card[n]=3♥︎
id[n]=28
;;
29)
card[n]=4♥︎
id[n]=29
;;
30)
card[n]=5♥︎
id[n]=30
;;
31)
card[n]=6♥︎
id[n]=31
;;
32)
card[n]=7♥︎
id[n]=32
;;
33)
card[n]=8♥︎
id[n]=33
;;
34)
card[n]=9♥︎
id[n]=34
;;
35)
card[n]=10♥︎
id[n]=35
;;
36)
card[n]=J♥︎
id[n]=36
;;
37)
card[n]=Q♥︎
id[n]=37
;;
38)
card[n]=K♥︎
id[n]=38
;;
39)
card[n]=A♥︎
id[n]=39
;;
40)
card[n]=2♦︎
id[n]=40
;;
41)
card[n]=3♦︎
id[n]=41
;;
42)
card[n]=4♦︎
id[n]=42
;;
43)
card[n]=5♦︎
id[n]=43
;;
44)
card[n]=6♦︎
id[n]=44
;;
45)
card[n]=7♦︎
id[n]=45
;;
46)
card[n]=8♦︎
id[n]=46
;;
47)
card[n]=9♦︎
id[n]=47
;;
48)
card[n]=10♦︎
id[n]=48
;;
49)
card[n]=J♦︎
id[n]=49
;;
50)
card[n]=Q♦︎
id[n]=50
;;
51)
card[n]=K♦︎
id[n]=51
;;
52)
card[n]=A♦︎
id[n]=52
esac
done
unset array
unset combo
unset st
unset straight
st_f=0
unset s1
unset s2
p=0
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
combo="A pair"
;;
2)
#Two pairs
combo="Two pairs"
;;
3)
#Three of a kind
combo="Three of a kind"
;;
4)
#Full house
combo="Full house"
;;
6)
#Four of a kind
combo="Four of a kind"
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
combo="Straight"
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
combo="Flush"
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
combo="Royal flush"
else
combo="Straight-flush"
fi
fi
fi

#Higest card
if [[ "$combo" = "" ]]
then
combo="Highest card"
fi

echo "${card[1]} ${card[2]} ${card[3]} ${card[4]} ${card[5]} ${card[6]} ${card[7]} $combo "

done
