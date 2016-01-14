#!/usr/local/bin/bash
#!/usr/bin/expect -f
vtn="/opt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync"
vt="/opt/vde/services/instances/vde_latest/bin/vde_tool"
flag="--Vforce --Vtime 30d --Vreason bugfix"

rm -f makefile
if [ ! -f makefile ]
then
    cp /ws/jelou/playground/cache/makefile_pak ./makefile
fi

cur_path=`pwd`;


 [[ $cur_path =~ "(CSC.*[0-9]{5})" ]]
 ddts="${BASH_REMATCH[1]}"


echo "current path is $cur_path ddts is $ddts"

ls -l makefile
#sed -i "s/icidicf/$ddts/g" makefile

echo "sync in makefile"
${vt} ${flag} sync_in makefile


echo "copy image to /auto/tftp-sjc-users2/crdc_cable/$USER/"
${vtn} ${flag} make vto_creg


echo "creg for $ddts /auto/tftp-sjc-users2/crdc_cable/$USER/packages.conf"
#${vtn} ${flag} make copy-image


#echo "sync_out cbrsup* and *.conf"
#${vt} ${flag} sync_out cbrsup*
#${vt} ${flag} sync_out packages.conf


#echo "copy image to 10.74.58.208"
#scp * jelou@10.74.59.217:/tftpboot/jelou/
