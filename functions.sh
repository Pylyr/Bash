#!/bin/bash

/not () {
if [[ "$1" = "0" ]]
then
echo "1"
else
echo "0"
fi
}

/and () {
if [[ "$1" = "$2" ]]
then
echo "$1"
else
echo "0"
fi
}

/or () {
if [[ "$1" = "1" || "$2" = "1" ]]
then
echo "1"
else
echo "0"
fi
}

/xor () {
if [[ "$1" = "$2" ]]
then
echo "0"
else
echo "1"
fi
}

