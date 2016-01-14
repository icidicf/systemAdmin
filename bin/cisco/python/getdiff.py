#!/router/bin/python
import sys
import os
import re
import time
import shutil

#get diff file and backup with date as suffix

vt = "/opt/vde/services/instances/vde_latest/bin/vde_tool "
vtn = vt + "--Vno_sync"

if __name__ == "__main__":
    cur_pwd = os.getcwd();
    m = re.search ('(CSC.*[0-9]{5}).*', str(cur_pwd))
    ddts_name = m.group(1)
    print "cur path %s ddts %s" % (cur_pwd, m.group(1))


    d = re.search ('(.*sys).*', str(cur_pwd))
    dir = d.group(1)
    diff_back_dir = dir+"/diff_back"
    print "dir is %s diff back %s" % (dir , diff_back_dir)

    if not os.path.exists(diff_back_dir):
        os.mkdir(diff_back_dir)


    print "go to get temp.diff  for %s" % (ddts_name)
    os.system(vtn + " cc_diff > temp.diff" )

    dest_backup_diff_name = os.path.join(diff_back_dir,
    ddts_name + "_diff_" + time.strftime("%Y%m%d-%H_%M_%S"))
    print "dest backup name is %s" % dest_backup_diff_name
    shutil.copyfile("temp.diff", dest_backup_diff_name)

