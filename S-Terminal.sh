#!/bin/bash
#reset; echo "$(date +%Y-%m-%d:%H:%M:%S)" >> .logt;  echo "Welcome to S-Terminal v.0.8"; echo "Made by Mark Daychman"; echo "Type /help to see the list of new commands"
#brew install coreutils
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
access=0
/hash () {
openssl sha1 <<< "$*"
}
for (( tries=3; ; tries-- ))
do
echo "#################################################"
echo "Welcome to S–Terminal OS!"|lolcat
echo "Enter the password:"
echo "$tries tries left"
echo "#################################################"
read pass
if [[ "$(/hash $pass)" = "ab614707929a4f682fcc9da79e1620129c2a71d3" ]] #Set-up your password using /hash your_password and pasting the hash in the conditional operation
then
#####Start of S–Terminal#####
access=1
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PS1="\[$(tput bold)\]\d\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;19m\]\t\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;19m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;160m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;160m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

reset; echo "$(date +%Y-%m-%d:%H:%M:%S)" >> .logt;  echo "Welcome to S-Terminal v.0.8"; echo "Made by Mark Daychman"; echo "Type /help to see the list of new commands"
/clear_logs () {
cd "$HOME"
rm -R .bash_sessions
rm -R .bash_history
rm -R .logt/Users/markdaychman/.bash_profile
echo "Logs cleared"
echo "Terminal re-boots in... 3"
sleep 1
echo "Terminal re-boots in... 2"
sleep 1
echo "Terminal re-boots in... 1"
sleep 1
killall Terminal
}

/binary () {
echo "obase=2;$1" | bc
}

/dec () {
echo "obase=10;ibase=2;$1"|bc
}

/length () {
echo "${#1}"
}

/size () {
q=$1
lim=$(echo "${#1}")
count=0
for ((n=0; n < lim; n++))
do
a=$(echo ${q:n:1})
if [[ "$a" = "1" ]]
then
count=$(($count+1))
fi
done
echo "$count"
}

/rain () {
echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'

}

/load () {
per=0
bar=0
for (( per=0; per <= 100 ; per++ ))
do
echo -ne "$bar "$per"%\r "
sleep_var=$(echo "scale=3; $1/100" |bc)
sleep "$sleep_var"

lastper=${per::${#per}-1}
case $lastper in
1)
bar=#
;;
2)
bar=##
;;
3)
bar=###
;;
4)
bar=####
;;
5)
bar=#####
;;
6)
bar=######
;;
7)
bar=#######
;;
8)
bar=########
;;
9)
bar=########
;;
10)
bar=##########
;;
*)
bar=
esac
done
}

/bin () {
unset bin_out
a=$*; size=${#a}
for (( bin_char=0; bin_char < size ; bin_char++))
do
bin=${a:$bin_char:1}
case $bin in
A|a)
bin_a="01100001"
bin_out="$bin_out""$bin_a"
;;
B|b)
bin_b="01100010"
bin_out="$bin_out""$bin_b"
;;
C|c)
bin_c="01100011"
bin_out="$bin_out""$bin_c"
;;
D|d)
bin_d="01100100"
bin_out="$bin_out""$bin_d"
;;
E|e)
bin_e="01100101"
bin_out="$bin_out""$bin_e"
;;
F|f)
bin_f="01100110"
bin_out="$bin_out""$bin_f"
;;
G|g)
bin_g="01100111"
bin_out="$bin_out""$bin_g"
;;
H|h)
bin_h="01101000"
bin_out="$bin_out""$bin_h"
;;
I|i)
bin_i="01101001"
bin_out="$bin_out""$bin_i"
;;
J|j)
bin_j="01101010"
bin_out="$bin_out""$bin_j"
;;
K|k)
bin_k="01101011"
bin_out="$bin_out""$bin_k"
;;
L|l)
bin_l="01101100"
bin_out="$bin_out""$bin_l"
;;
M|m)
bin_m="01101101"
bin_out="$bin_out""$bin_m"
;;
N|n)
bin_n="01101110"
bin_out="$bin_out""$bin_n"
;;
O|o)
bin_o="01101111"
bin_out="$bin_out""$bin_o"
;;
P|p)
bin_p="01110000"
bin_out="$bin_out""$bin_p"
;;
Q|q)
bin_q="01110001"
bin_out="$bin_out""$bin_q"
;;
R|r)
bin_r="01110010"
bin_out="$bin_out""$bin_r"
;;
S|s)
bin_s="01110011"
bin_out="$bin_out""$bin_s"
;;
T|t)
bin_t="01110100"
bin_out="$bin_out""$bin_t"
;;
U|u)
bin_u="01110101"
bin_out="$bin_out""$bin_u"
;;
V|v)
bin_v="01110110"
bin_out="$bin_out""$bin_v"
;;
W|w)
bin_w="01110111"
bin_out="$bin_out""$bin_w"
;;
X|x)
bin_x="01111000"
bin_out="$bin_out""$bin_x"
;;
Y|y)
bin_y="01111001"
bin_out="$bin_out""$bin_y"
;;
Z|z)
bin_z="01111010"
bin_out="$bin_out""$bin_z"
;;
0)
bin_0="00110000"
bin_out="$bin_out""$bin_0"
;;
1)
bin_1="00110001"
bin_out="$bin_out""$bin_1"
;;
2)
bin_2="00110010"
bin_out="$bin_out""$bin_2"
;;
3)
bin_3="00110011"
bin_out="$bin_out""$bin_3"
;;
4)
bin_4="00110100"
bin_out="$bin_out""$bin_4"
;;
5)
bin_5="00110101"
bin_out="$bin_out""$bin_5"
;;
6)
bin_6="00110110"
bin_out="$bin_out""$bin_6"
;;
7)
bin_7="00110111"
bin_out="$bin_out""$bin_7"
;;
8)
bin_8="00111000"
bin_out="$bin_out""$bin_8"
;;
9)
bin_9="00111001"
bin_out="$bin_out""$bin_9"
;;
" ")
bin_space="00100000"
bin_out="$bin_out""$bin_space"
;;
.)
bin_out="$bin_out"00101110
;;
,)
bin_out="$bin_out"00101100
;;
!)
bin_out="$bin_out"00100001
;;
?)
bin_out="$bin_out"00111111
;;
*)
bin_out="$bin_out"00101010

esac
done
echo "$bin_out"
}

/unbin () {
unset bin_out
a=$*; size=${#a}
for (( bin_char=0; bin_char < size; bin_char=$(($bin_char+8)) ))
do
bin=${a:$bin_char:8}
case $bin in
01100001)
bin_out="$bin_out"a
;;
01100010)
bin_out="$bin_out"b
;;
01100011)
bin_out="$bin_out"c
;;
01100100)
bin_out="$bin_out"d
;;
01100101)
bin_out="$bin_out"e
;;
01100110)
bin_out="$bin_out"f
;;
01100111)
bin_out="$bin_out"g
;;
01101000)
bin_out="$bin_out"h
;;
01101001)
bin_out="$bin_out"i
;;
01101010)
bin_out="$bin_out"j
;;
01101011)
bin_out="$bin_out"k
;;
01101100)
bin_out="$bin_out"l
;;
01101101)
bin_out="$bin_out"m
;;
01101110)
bin_out="$bin_out"n
;;
01101111)
bin_out="$bin_out"o
;;
01110000)
bin_out="$bin_out"p
;;
01110001)
bin_out="$bin_out"q
;;
01110010)
bin_out="$bin_out"r
;;
01110011)
bin_out="$bin_out"s
;;
01110100)
bin_out="$bin_out"t
;;
01110101)
bin_out="$bin_out"u
;;
01110110)
bin_out="$bin_out"v
;;
01110111)
bin_out="$bin_out"w
;;
01111000)
bin_out="$bin_out"x
;;
01111001)
bin_out="$bin_out"y
;;
01111010)
bin_out="$bin_out"z
;;
00110000)
bin_out="$bin_out"0
;;
00110001)
bin_out="$bin_out"1
;;
00110010)
bin_out="$bin_out"2
;;
00110011)
bin_out="$bin_out"3
;;
00110100)
bin_out="$bin_out"4
;;
00110101)
bin_out="$bin_out"5
;;
00110110)
bin_out="$bin_out"6
;;
00110111)
bin_out="$bin_out"7
;;
00111000)
bin_out="$bin_out"8
;;
00111001)
bin_out="$bin_out"9
;;
00100000)
bin_out=""$bin_out" "
;;
00101110)
bin_out="$bin_out".
;;
00101100)
bin_out="$bin_out",
;;
00100001)
bin_out="$bin_out"!
;;
00111111)
bin_out="$bin_out"?
;;
*)
bin_out="$bin_out"*

esac
done
echo "$bin_out"
}

/screen_stop () {
screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

/ddos () {
if [[ "$#" != "2" ]]
then
echo "Usage: /ddos password ip"
else
echo -e "$1"| sudo -S ping -f "$2"
fi
}

/exit () {
exit
}

/rexit () {
reset
exit
}

/time () {
echo "$SECONDS"
}

/desktop () {
cd "$HOME"
cd Desktop/
}

/random () {
if [[ "$#" != "2" ]]
then
echo "Usage: /random min_val max_val"
else
shuf -i "$1"-"$2" -n 1
fi
}

/c () {
clear
}

/r () {
reset
}

/version () {
echo "Bash version: $BASH_VERSION"
}

/s () {
if [[ "$#" != "1" ]]
then
echo "Usage: /s seconds"
else
sleep $1
fi
}

/o () {
if [[ "$#" != "1" ]]
then
echo "Usage: /o (file, link...)"
else
open $1
fi
}

/stopwatch () {

BEGIN=$(date +%s)

echo Starting Stopwatch...

while true; do
NOW=$(date +%s)
let DIFF=$(($NOW - $BEGIN))
let MINS=$(($DIFF / 60))
let SECS=$(($DIFF % 60))
let HOURS=$(($DIFF / 3600))
let DAYS=$(($DIFF / 86400))

# \r  is a "carriage return" - returns cursor to start of line
printf "\r%3d Days, %02d:%02d:%02d" $DAYS $HOURS $MINS $SECS
sleep 0.25
done
}


/password () {
if [[ "$#" -gt 1 ]]
then
echo "Usage: /password pass_length"
fi

SYMBOLS=""
for symbol in {A..Z} {a..z} {0..9}; do SYMBOLS=$SYMBOLS$symbol; done
SYMBOLS=$SYMBOLS'!@#$%&*()?/\[]{}-+_=<>.,'
if [[ "$#" = "0" ]]
then
PWD_LENGTH=8
else
PWD_LENGTH=$1
fi
PASSWORD=""
RANDOM=256
for i in `seq 1 $PWD_LENGTH`
do
PASSWORD=$PASSWORD${SYMBOLS:$(expr $RANDOM % ${#SYMBOLS}):1}
done
echo $PASSWORD
}

/aes () {

/desktop

if [[ "$#" != "3" ]]
then
echo "Usage: /aes [enc - encrypt; dec - decrypt] [save name] [file]"
else

if [[ "$1" = "enc" ]]
then
openssl enc -aes-256-cbc -salt -a -in "$3" -out "$2".enc
elif [[ "$1" = "dec" ]]
then
echo "What is the extension of the file?"
read exp
openssl enc -aes-256-cbc -d -a -in "$3" -out "$2""$exp"
fi
echo "File saved on your desktop"
fi
}

/weather () {
if [[ "$#" = "0" ]]
then
echo "Usage: /weather city"
else
curl wttr.in/"$*"
fi
}

/visible_files () {
if [[ "$1" = "true" ]]
then
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder
elif [[ "$1" = "false" ]]
then
defaults write com.apple.finder AppleShowAllFiles -bool false
killall Finder
else
echo "Usage: /visibile_files [true - make files visible] [false - make files invisible]"
fi
}

/help () {
help=$(compgen -A function)
selectstmt=$(echo -e $var)
echo "$help"| sed '$d' | sed '$d' | sed '$d' | sed '$d' | sed '$d' | sed '$d' | sed '$d' | sed '$d'
}

/vk () {
open https://vk.com/
}

/google () {
if [[ "$#" = "0" ]]
then
echo "Usage: /google text"
else
open "https://www.google.com/search?site=&source=hp&q=$*"
fi
}

/youtube () {
open https://youtube.com/
}

/dota () {
open steam://run/570
}

/killurself () {
killall Terminal
}
break
#####End of S–Terminal#####
fi
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
if [[ "$tries" = "1" ]]
then
exit
fi
done


