#!/bin/bash
reset
echo "
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
....///////...///////.................//...........//.............
....+////++/..+////++/..............///+++.......//////...........
......./+/......./+/.......////..//...../-/......+/...+/..........
....../+/......./+/........./+/..//.....//....../-/...+/..........
..../+/..../../+/..../......./+///....//......../+/../+/..........
.../+//////+//+//////+/......./+/.../++/++/..//..//////...........
.../////////./////////........./...../////.........//.............
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
..................................................................
"
sleep 2.5
function wordfrequency() {
awk '{for(w=1;w<=NF;w++) print $w}' $1 | sort | uniq -c | sort -nr
}

while :
do
#reset
echo "Would you like to compress or decompress your file?"
echo "Type 1 for compression"
echo "Type 2 for decompression"
read -rsn1 ans
case $ans in
1)
echo "Insert the path to the text document, which you would like to compress:"
read word
filename=$(basename "$word")
extension="${filename##*.}"
filename="${filename%.*}"
cd "$(dirname $word)"
echo "Enter the level of compression:"
echo "Larger number -> More space saved"
read num
touch "$filename".zz
for ((i=1; i<=$num; i++))
do
#word
a=$(cat "$word" | wordfrequency |awk '{print $2;}'| sed -n "${i} p")
#repetitions
b=$(cat "$word" | wordfrequency |awk '{print $1;}'| sed -n "${i} p")
if [[ "$b" -ge "5" &&"${#a}" -ge "4" ]] #configuration
then
echo "$a" >> "$filename".zz
fi
echo -ne "Creating Dictionnary: $(($i*100/$num))% \r"
done
echo "</dic>" >> "$filename".zz
space=$(cat "$word")

for ((k=1; k <= num; k++))
do
replace=$(sed "${k}q;d" "$filename".zz)
if [[ "$replace" = "</dic>" ]]
then
break
fi
space=$(echo "$space" |awk -v re="$replace" -v i="<$k>" '{gsub(re ,i)}1')
done
echo "$space" >> "$filename".zz
;;
2)
echo "Insert the path to the text document, which you would like to decompress:"
read word
filename=$(basename "$word")
extension="${filename##*.}"
filename="${filename%.*}"
cd "$(dirname $word)"
touch "$filename".txt
space=$(cat "$word")
div=$(grep -n "</dic>" "$filename".zz | cut -d: -f1)
for ((k=1;k<div ; k++))
do
replace=$(sed "${k}q;d" "$filename".zz)
space=$(echo "$space" |awk -v re="<$k>" -v i="$replace" '{gsub(re,i )}1')
done
echo "$space" |sed -e "1,${div}d" >> "$filename".txt
;;
*)
echo "Unexpected input"
esac
done
