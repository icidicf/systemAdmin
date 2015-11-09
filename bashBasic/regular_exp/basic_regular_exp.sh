#!/bin/bash

regex='xunil'
if [[ $PWD =~ $regex ]]
then
    echo "$PWD is in linux dir"
else
    echo "$PWD is not linux dir "
fi


