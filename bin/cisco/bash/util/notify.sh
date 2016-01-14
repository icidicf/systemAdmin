#!/usr/bin/bash

if [ $# -ne 2 ]
then
    echo "pls specify receiver and message "
    exit
fi
user=$1
message="\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"`date`"---"$2"\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"

devices=`ls /dev/pts/* -l | awk '{print $3,$10}' | grep $user | awk '{ print $2 }'`

for dev in $devices;
do
    echo 
