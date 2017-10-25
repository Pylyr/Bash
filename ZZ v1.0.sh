#!/bin/bash
echo "ZZ .txt compressor by Mark Daychman!"
sleep 1
while :
do
echo "Would you like to compress or decompress your file?"
echo "Type 1 for compression"
echo "Type 2 for decompression"
read ans
case $ans in
1)
echo "Insert the path to the text document, which you would like to compress:"
read word
echo "Insert the level of compression:"
echo "P.S. Higher value means more space saved, but the proccess will be slower (Max. 20'000)"
read comp
space=$(cat "$word")

for ((i=1; i<=comp; i++))
do
replace=$(sed "${i}q;d" "/Users/markdaychman/Desktop/.Maths and Computer Science/Compression/ZZ v1.0/17913.txt")
space=$(echo "$space" |awk -v re=" $replace " -v i=" <$i> " '{gsub(re,i)}1'|awk -v re=" $replace " -v i=" <$i> " '{gsub(re,i)}1')
done
for ((i=1; i<=comp;i++))
do
space=$(echo "$space"|awk -v re=" <$i> " -v i="<$i>" '{gsub(re,i)}1'|awk -v re=" <$i> " -v i="<$i>" '{gsub(re,i)}1')
done
echo "$space"
;;
2)
echo "Insert the path to the text document, which you would like to decompress:"
read word
echo "Insert the level of compression which was used:"
echo "P.S. Higher value means more space saved, but the proccess will be slower (Max. 20'000)"
read comp
#word_count=$(wc -w word)
space=$(cat "$word")
for ((i=1; i<=comp; i++))
do
replace=$(sed "${i}q;d" "/Users/markdaychman/Desktop/.Maths and Computer Science/Compression/ZZ v1.0/17913.txt")
space=$(echo "$space" |awk -v re="<$i>" -v i=" $replace " '{gsub(re,i)}1')
done
echo "$space" | sed 's/  */ /g'
;;
*)
echo "Unexpected input"
esac
done
