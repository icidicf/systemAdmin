
pt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync"
vt="/opt/vde/services/instances/vde_latest/bin/vde_tool"
flag="--Vforce --Vtime 30d --Vreason bugfix"
cur_PID=$$
bugid=$1
appenx=$2
dirname=$1"_"$2
edit_server=`uname -a | awk '{print $2}'`
cd /ws/$USER/
mkdir $dirname
cd    $dirname
view_name=$USER"-"$dirname
work_space="/ws/"$USER
echo $view_name
echo $work_space
usage()
{
    echo "**********************************************************"
    echo "creat_view.sh Bugid"
    exit 1
}

if [ $# = 0 ]
then
    usage
fi

echo "select the code server"
echo "1:cable-view2-cs1"
echo "2:cable-view2-cs2"
echo "3:cable-view2-cs3"
echo "4:cable-view2-cs4"
echo "5:cable-view2-cs5"
echo "6:cable-view2-cs6"
echo "7:cable-view2-cs7"
echo "8:bxb-ads-404"
echo "9:sjc-ads-1670"
read server_sel
case $server_sel in
1)
        code_server="cable-view2-cs1"
        ;;
2)
        code_server="cable-view2-cs2"
        ;;
3)
        code_server="cable-view2-cs3"
        ;;
4)
        code_server="cable-view2-cs4"
        ;;
5)
        code_server="cable-view2-cs5"
        ;;
6)
        code_server="cable-view2-cs6"
        ;;
7)
        code_server="cable-view2-cs7"
        ;;
8)
        code_server="bxb-ads-404"
        ;;
9)
        code_server="sjc-ads-1670"
        ;;
esac
echo $code_server

echo "select code branch"
echo "1:guardian_cable"
echo "2:sci_ewr_1"
echo "3:v122_33_sci_throttle"
echo "4:v122_33_sch_throttle"
echo "5:v122_33_scg_throttle"
echo "6:v122_33_scj_throttle"
read sel_num
case $sel_num in
1)
        branch="guardian_cable"
        ;;
2)
        branch="sci_ewr_1"
        ;;
3)
        branch="v122_33_sci_throttle"
        ;;
4)
        branch="v122_33_sch_throttle"
        ;;
5)
        branch="v122_33_scg_throttle"
        ;;
6)
        branch="v122_33_scj_throttle"
        ;;
esac
echo $branch
echo "input label(LATEST for default)"
read label
if [ -z $label ]
then
        label=LATEST
fi
echo $label
sleep 1


echo "include sun file(y/n)"
read yn
yn=y
case $yn in
y)
        gdb_flag='-g'
        ;;
n)
        gdb_flag=
        ;;
esac
sleep 1


echo "build pre5(y/n)"
read yn
case $yn in
y)
        build_pre5=y
        ;;
n)
        build_pre5=n
        ;;
esac
sleep 1

echo "build ISSU(y/n)"
read yn
case $yn in
y)
        echo "TEST(T) or CURR(C)  "
        read issu_ver
        case $issu_ver in
            C) issu_rel="ISSU_CURR_REL=TRUE"
            ;;

            T) issu_rel="ISSU_TEST_REL=TRUE"
            ;;
        esac


        echo "choose min_ver"
        echo "h1) V122_33_SCH1"
        echo "I1) V122_33_SCI1"
        read min_ver
        case $min_ver in
            h1)
            issu_min_ver="ISSU_MIN_VER=V122_33_SCH1"
            ;;
            I1)
            issu_min_ver="ISSU_MIN_VER=V122_33_SCI1"
            ;;
            esac
        ;;

esac
issu=$issu_rel"  "$issu_min_ver
echo "issu str is $issu"
sleep 1


echo "$build pre4 is y, build pre5 is $build_pre5"

echo "use $bugid for check"
#read yn
yn=1
case $yn in
y)
        bugid_flag="-bug "$bugid
        ;;
n)
        bugid_flag=""
        ;;
esac
echo $bugid_flag

sleep 1

if [ $code_server = "bxb-ads-404" ]
    then
    echo "coder server is $code_server"
    echo "$dirname $branch $lable $view_name"
    ${vtn}  ${flag} ws set --ws /ws/$USER/$dirname --cs $code_server --role cable_ios --res vob-src
    ${vtn}  ${flag} start_task -a  -d /nobackup/$USER -f -v /vob/ios -t $dirname -b $branch -l $label $bugid_flag
    ${vt}  ${flag} ct setview $view_name
    cd ios/sys/
    ${vtn}  ${flag} fbe_make dependencies
else
    echo "coder server is $code_server"
    echo "$dirname $branch $lable $view_name"
    ${vtn}  ${flag} ws set --ws /ws/$USER/$dirname --cs $code_server --role cable_ios --res vob-src
    ${vtn}  ${flag} start_task -ni -d /ws/$USER"-sjc" -f -v /vob/ios -t $dirname -b $branch -l $label $bugid_flag
    ${vt}  ${flag} ct setview $view_name
    echo `pwd`
    cd ios/sys/
    ${vtn}  ${flag} make dependencies
fi
cp ~/env.cs ./.VDEROOT



cscope -Rb
/usr/bin/ctags  -R

if [ $code_server = "bxb-ads-404" ]
then
    cd obj-4k-cr10k4-rp
    ${vtn}  ${flag} fbe_make -j 8 -k GDB_FLAG=$gdb_flag COPY="cp" COLON= TFTPHOST=""  TFTPDIR="./" bin_suffix=.$dirname $issu ubr10k4-k9p6u2-mz | tee log
    if [ $build_pre5 = y ]
    then
        cd ../obj-ppc-cr10k5-rp
        ${vtn}  ${flag} fbe_make -j 8 -k GDB_FLAG=$gdb_flag COPY="cp" COLON= TFTPHOST=""  TFTPDIR="./" bin_suffix=.$dirname $issu ubr10k5-k9p6u2-mz | tee log
    fi
else
    cd obj-4k-cr10k4-rp
    ${vtn}  ${flag} make -j 8 -k GDB_FLAG=$gdb_flag COPY="fbscp" COLON= TFTPHOST=""  TFTPDIR=$edit_server:/tftpboot/jelou bin_suffix=.$dirname $issu ubr10k4-k9p6u2-mz | tee log
    if [ $build_pre5 = y ]
    then
        cd ../obj-ppc-cr10k5-rp
        ${vtn}  ${flag} make -j 8 -k GDB_FLAG=$gdb_flag COPY="fbscp" COLON= TFTPHOST=""  TFTPDIR=$edit_server:/tftpboot/jelou bin_suffix=.$dirname $issu ubr10k5-k9p6u2-mz | tee log
    fi
fi

gimg
