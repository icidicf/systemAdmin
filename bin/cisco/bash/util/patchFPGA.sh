#!/usr/bin/bash

vtn="/opt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync"
vt="/opt/vde/services/instances/vde_latest/bin/vde_tool"
flag="--Vforce --Vtime 30d --Vreason bugfix"


cur_path=`pwd`
 [[ $cur_path =~ "(CSC.*[0-9]{5})" ]]
 ddts="${BASH_REMATCH[1]}"


${vtn} ${flag} static_iosbranch -saimages=x86_64bi_linux_iosd_ubr-adventerprisek9-ms,ubrclc-k9lc-ms -bugid=$ddts



