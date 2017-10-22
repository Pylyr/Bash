#!/bin/bash
/cl () {
for (( i=0; i<=$1; i++))
do
tput el
tput cuu1
done
}
reset
up_1=10
up_2=10
up_3=100
up_4=500
up_5=5000
up_6=20000
bal=0
click=1
prod=0
num_clickups=0
num_ovens=0
num_farms=0
num_factories=0
num_corps=0
num_planets=0
while :
do
unset ans
prod=$(($num_ovens+5*$num_farms+20*$num_factories+100*$num_corps+500*$num_planets))
if [[ "$(($SECONDS%5))" = "0" ]]
then
bal=$(($prod+$bal))
fi
echo "Press 'C' to get Cookies"
echo "Press 'S' to open the list of all possible upgrades"
echo "Your click-cost is $click per click"
echo "Your productivity is $prod cookies per 5 second"
echo " "
echo "You owe:"
echo "Click-ups: $num_clickups"
echo "Ovens: $num_ovens"
echo "Farms: $num_farms"
echo "Factories: $num_factories"
echo "Corporations: $num_corps"
echo "Planets: $num_planets"
echo "Your balance: $bal Cookies"
read -rsn1 -t 1 ans; echo "$ans"
case $ans in
S|s)
reset
while :
do
echo "Welcome to the shop!"
echo "Here you can buy upgrades to increase your click-cost or your productivity!"
echo " "
echo "Your balance is $bal Cookies"
echo " "
echo "1 Click-up = +1 Cookie per click "
echo "Price: $up_1 Cookies; Press 1)"
echo " "
echo "Oven = +1 to the productivity"
echo "Price: $up_2 Cookies; Press 2)"
echo " "
echo "Farm = +5 to the productivity"
echo "Price: $up_3 Cookies; Press 3)"
echo " "
echo "Factory: +20 to the productivity"
echo "Price: $up_4 Cookies; Press 4)"
echo " "
echo "Corportation : +100 to the productivity"
echo "Price: $up_5 Cookies; Press 5)"
echo " "
echo "Planet: +500 to the productivity"
echo "Price: $up_6 Cookies; Press 6)"
echo " "
echo "Press 7) to quit"
read -rsn1 shop
case $shop in
1)
if [[ "$bal" -lt "$up_1" ]]
then
echo "Not enough money!"
sleep 1
else
echo "Purchase Successful!"
bal=$(($bal-$up_1))
up_1=$(($up_1*22/10))
num_clickups=$(($num_clickups+1))
click=$(($click+1))
fi

;;
2)
if [[ "$bal" -lt "$up_2" ]]
then
echo "Not enough money!"
sleep 1
else
echo "Purchase Successful!"
bal=$(($bal-$up_2))
up_2=$(($up_2*12/10))
num_ovens=$(($num_ovens+1))
fi

;;
3)
if [[ "$bal" -lt "$up_3" ]]
then
echo "Not enough money!"
sleep 1
else
echo "Purchase Successful!"
bal=$(($bal-$up_3))
up_3=$(($up_3*13/10))
num_farms=$(($num_farms+1))
fi

;;
4)
if [[ "$bal" -lt "$up_4" ]]
then
echo "Not enough money!"
sleep 1
else
echo "Purchase Successful!"
bal=$(($bal-$up_4))
up_4=$(($up_4*14/10))
num_factories=$(($num_factories+1))
fi

;;
5)
if [[ "$bal" -lt "$up_5" ]]
then
echo "Not enough money!"
sleep 1
else
echo "Purchase Successful!"
bal=$(($bal-$up_5))
up_5=$(($up_5*15/10))
num_corps=$(($num_corps+1))
fi

;;
6)
if [[ "$bal" -lt "$up_6" ]]
then
echo "Not enough money!"
sleep 1
else
echo "Purchase Successful!"
bal=$(($bal-$up_6))
up_6=$(($up_6*16/10))
num_planets=$(($num_planets+1))
fi

;;
7)
/cl 24
break
;;
*)
echo "Unexpected input"
/cl 24
esac
reset
done
;;
C|c)
bal=$(($bal+$click))
/cl 13
;;
*)
/cl 14
esac
done
#tput el
#tput cuu1









