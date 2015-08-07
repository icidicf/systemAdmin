#!/bin/sh
unset var
#while [ "$var" != "end" ]
while [ 1 ]
do
     echo -n "please input a number: "
     read var
     if [ "$var" = "end" ]
     then
         break
     fi
     echo "var is $var"
done
