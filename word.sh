#!/bin/bash

clear

if [ -z $1 ]; then
	echo "Argument: ./word.sh filename.csv"
	exit
fi

# save previous IFS
OLDIFS=$IFS
# new IFS: ,
IFS=","

# word number
num=1

# read csv and line (3 columns)
while read f1 f2
do
    echo "No. $num"
    echo
    echo "     $f1"  # English word
    echo
    sleep 3
    echo "     $f2"  # Meaning
    echo
    sleep 1
    clear
    num=`expr $num + 1`
done < $1

# restore IFS
IFS=$OLDIFS
