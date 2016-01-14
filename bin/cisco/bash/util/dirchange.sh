#!/usr/bin/bash


cur_path=`pwd`

# [[ $cur_path =~ "(/ws/jelou/CSC[^/]*)" ]]
[[ $cur_path =~ "(/ws/jelou/[^/]*)" ]]

#[[ $cur_path =~ "(jelou)" ]]
pre_fix="${BASH_REMATCH[1]}"

echo "pre_fix is $pre_fix"

if [ -z $pre_fix ]
then
echo "please do it under valid view"
exit
fi


if [ -z $1 ]
then
echo "input dir you want to change to "
exit
fi

case $1 in
"-binos")
dest_dir=$pre_fix/binos/
;;
"-cbr")
dest_dir=$pre_fix/binos/linkfarm/iso-cbr/
;;
"-docsis")
dest_dir=$pre_fix/ios/ios/sys/src-ubr/docsis
;;
"-lb")
dest_dir=$pre_fix/ios/ios/sys/src-ubr/apps/loadbalance
;;
"-ios")
if [ -d $pre_fix/ios/sys/ ]
then
dest_dir=$pre_fix/ios/sys/
elif [ -d $pre_fix/ios/ios/sys/ ]
then
dest_dir=$pre_fix/ios/ios/sys/
else
echo "not support to chande ios"
fi
;;

"-cylon")
dest_dir=$pre_fix/ios/ios/sys/obj-mips64-ubr-clc
;;
"-sup")
dest_dir=$pre_fix/ios/ios/sys/obj-x86_64bi-ubr-iosd
;;
esac

if [ -z $dest_dir ]
then
echo "invalid dest_dir, check your input "
#    exit
else
cd $dest_dir
fi


#echo "go to dir $dest_dir"

#cd $dest_dir
