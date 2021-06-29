#!/bin/bash
if [ $# -eq 1 ]
then
  echo "Need atleast 2 arguments(Source & Destination) but $# given"
  exit 1
fi
#echo "$# arguments given"
tes="/"
#s1="${1%/}"
d2="${@: -1}"
d2="${d2%/}"
#echo "$d2"

if [ -f $d2 ]
then
  echo "Last argument should be directory"
  exit 1
fi

d2+=$tes

for var in "$@"
do
  if [ $var = ${@: -1} ]
  then
    exit 1
  fi
  s1="${var%/}"
  #echo "$s1"
  #d2+=$tes
  if [ -d $s1 ]
  then
    s1+=$tes
    if [ "$s1" != "$d2" ]
    then
      d2="$d2$(basename $s1)$tes"
      cd "$s1"
      #echo "$s1 $d2"
      find . -type d -exec mkdir -p "$d2{}" \;
      find . -type f -print -exec dd if={} of="$d2{}" bs=16M iflag=direct oflag=direct status=none \;
    else
      echo "Source and Destination cannot be same"
      exit 1
    fi
  elif [ -f $s1 ]
  then
    mkdir -p "$d2"
    touch "$d2$(basename $s1)"
    dd if="$s1" of="$d2$(basename $s1)" bs=16M iflag=direct oflag=direct status=none
    echo "$s1"
  else
    echo "First argument should be a file or a directory"
    exit 1
  fi
done
