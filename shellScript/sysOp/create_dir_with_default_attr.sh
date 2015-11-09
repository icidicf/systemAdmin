#!/bin/bash
_mkdir(){
    local d="$1"               # get dir name
    local p=${2:-0755}      # get permission, set default to 0755
    [ $# -eq 0 ] && { echo "$0: dirname"; return; }
    echo "the permission is $p"
    [ ! -d "$d" ] && mkdir -m $p -p "$d"

}

while [ "$var" != "end" ]
do
    unset var 
    echo -n "please input a dir name : "
    read var 
    _mkdir $var 
done
