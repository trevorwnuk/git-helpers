#!/bin/sh

if [ "$1" = "" ]
then
  echo "Must pass previous tag as 'prev' argument"
  exit
else
  prev=$1
fi

if [ "$2" = "" ]
then
  echo "Must pass current tag as 'curr' argument"
  exit
else
  curr=$2
fi

CR_START_DATE=$(git show "$prev" | grep 'Date: ' -m 1 | egrep -o '[^Date:   ].*')
CR_END_DATE=$(git show "$curr" | grep 'Date: ' -m 1 | egrep -o '[^Date:   ].*')
git log --grep='Merge pull request' --since="$CR_START_DATE" --until="$CR_END_DATE" | grep 'Merge pull request ' | egrep -o '[^Merge pull request ].*'