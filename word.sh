#!/bin/bash

clear

if [ -z $1 ]; then
	echo "Usage: word.sh [filename.csv]"
	exit
fi

# save previous IFS
OLDIFS=$IFS
# new IFS: comma
IFS=","

# initial variable
num=0
wordlist=()
wordmean=()

# read csv and line (3 columns)
while read f1 f2
do
    wordlist[$num]=$f1
    wordmean[$num]=$f2
    num=`expr $num + 1`
done < $1

# start quiz
for (( i = 0 ; i < ${#wordlist[@]} ; i++ )); do
    echo "No. $((i+1))"
    echo
    echo "     ${wordlist[$i]}"  # English word
    echo
    read -p "? " userinput
    echo
    echo "     ${wordmean[$i]}"  # Meaning
    echo
    
    if [ x${wordmean[$i]} == x$userinput ]
    then
        echo "Correct!"
    else
        echo "Wrong..."
    fi

    read -p "Press ENTER to go next..."
    clear
done

# restore IFS
IFS=$OLDIFS
