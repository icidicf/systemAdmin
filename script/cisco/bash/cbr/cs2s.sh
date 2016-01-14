#!/usr/local/bin/bash
#!/usr/bin/expect -f
vtn="/opt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync"
vt="/opt/vde/services/instances/vde_latest/bin/vde_tool"
flag="--Vforce --Vtime 30d --Vreason bugfix"


source dirchange -ios
cur_path=`pwd`;


 [[ $cur_path =~ "(CSC.*[0-9]{5})" ]]
 ddts="${BASH_REMATCH[1]}"


echo "current path is $cur_path ddts is $ddts"


echo "do s2s for $ddts"


grep "mcp_dev" branch_label_and_token
if [ $? == 0 ]
    then
    echo "this is mcp_dev"
    ${vtn} s2s submit -p mcp_dev   $ddts --no_prepare | tee s2s_cmd
fi

grep "xe316" branch_label_and_token
if [ $? == 0 ]
    then
    echo "this is xe316"
    ${vtn} s2s submit -p XE316   $ddts --no_prepare | tee s2s_cmd
fi

