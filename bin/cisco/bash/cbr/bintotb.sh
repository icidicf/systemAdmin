#!/usr/bin/bash

vtn="/opt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync"
vt="/opt/vde/services/instances/vde_latest/bin/vde_tool"
flag="--Vforce --Vtime 30d --Vreason bugfix"

if [ -f makefile ]
then
    rm makefile
fi

cur_path=`pwd`;


 [[ $cur_path =~ "(CSC.*[0-9]{5})" ]]
 ddts="${BASH_REMATCH[1]}"


if [ -z $1 ]
then
    echo "give y if need syn , give n if not need sync"
    exit
else

    if [ $1 = '-y' ]
    then
        need_sync=1
        rm cbrsup*
        rm packages.conf
    else
        need_sync=0
    fi
fi


image=`${vtn} ${flag} ls | egrep -o "cbrsup-universal.*SSA\.bin"`
if [ $need_sync = 1 ]
then

    echo "sync_out $image"
    ${vt} ${flag} sync_out $image

#    echo "sync_out cbrsup* and *.conf"
#    ${vt} ${flag} sync_out cbrsup*
#    ${vt} ${flag} sync_out packages.conf
else
    echo "not need sync_out $image"
fi

/users/jelou/local/bin/im  $ddts


scp $image  jelou@10.74.59.217:/tftpboot/jelou/$ddts

echo "pls copy image to TB"
#echo "scp jelou@10.74.59.217:/tftpboot/jelou/$ddts/*  ./"
echo "scp jelou@10.74.59.217:/tftpboot/jelou/$ddts/$image  ./"

#echo "b bootflash:jelou/$ddts/packages.conf"
echo "b bootflash:jelou/$ddts/$image"
