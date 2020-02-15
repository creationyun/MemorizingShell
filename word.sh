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

# initialize variables
num=0
wordlist=()
wordmean=()
right=0
wrong=0

# read csv in each line (2 columns)
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
    
    if [[ ${wordmean[$i]} == $userinput ]]; then
        echo "Correct!"
        right=`expr $right + 1`
    else
        echo "Wrong..."
        wrong=`expr $wrong + 1`
    fi

    read -p "Press ENTER to go next..."
    clear
done

echo "Result"
echo
echo "Correct: $right"
echo "  Wrong: $wrong"

# restore IFS
IFS=$OLDIFS
