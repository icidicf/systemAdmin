#/bin/bash


arr[0]="test1"
arr[1]="test2"
arr[2]="test3"
arr[3]="test4"
arr[4]="test5"
arr[5]="test6"
arr[6]="test7"

echo "the ele on 5 is ${arr[5]}"
echo "the element count of  ${#arr[*]}"
echo "the eles in arr is ${arr[*]}"

echo "the key for arry is "     ${!arr[*]}
