#!/usr/local/bin/bash
#!/usr/bin/expect -f
vtn="/opt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync"
vt="/opt/vde/services/instances/vde_latest/bin/vde_tool"
flag="--Vforce --Vtime 30d --Vreason bugfix"


if [ -z $1  ]
then
    echo "please give new token"
    exit
fi

binos_token=$1

${vt} abraxas-client.SignEngine_rev -r create-ticket -b CBR -k DEV -n 1000 -U jelou -P $binos_token |  tee -a binos_cmd_key

