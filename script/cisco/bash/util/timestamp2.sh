#/usr/bin/bash

now=$(date "+%Ss-%Hh-%Mm-%d-%B")
if [ -z $1 ]
then
filename=temp.diff-$now
else
filename=$1-$now
fi

