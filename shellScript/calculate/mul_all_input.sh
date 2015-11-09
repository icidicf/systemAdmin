#! /bin/sh
result=1
while [ $# -gt 0 ]
do
     result=`expr $result \* $1`
# take care to add \ before *
     echo $1
     shift
done
echo $result
