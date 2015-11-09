#!/bin/bash
#touch `bash touch_mul_file.sh` 
for ((i=1 ; i<10; i++))
do 
    echo No$i+`date +%y%m%d%%H%M%S%N`
done

