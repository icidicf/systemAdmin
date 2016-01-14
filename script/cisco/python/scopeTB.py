#!/router/bin/python

import re
import subprocess
import datetime
import socket
import time

from ftplib import FTP

vt = "/opt/vde/services/instances/vde_latest/bin/vde_tool "
vtn = vt + "--Vno_sync "


tb_result = 'TB-scope-%s' %  socket.gethostname()
                 #  (datetime.datetime.now().strftime('%b-%d-%Hh-%Mm-%Ss')))

#print tb_result
#def createSSHClient(server)

def check_who_use_TB():
    result = subprocess.Popen(["ps -ef | grep telnet"], stdout=subprocess.PIPE, shell=True)
    (out, err) = result.communicate()
   # print out
    cons = re.finditer('.*con-\d+\s+\d+', out)
    f = open(tb_result, 'w')
    for i in cons:
        line = i.group()+'\n'
#       print line
        f.write(line)
    f.close()
    ftp = FTP('10.74.58.208')
    ftp.login('jelou','lab123')
    ftp.cwd('TB_check')
   # ftp.retrlines('LIST')
    ftp.storbinary('STOR ' + tb_result, open(tb_result, 'rb'))
    ftp.close()

if __name__=='__main__':
    while True:
        print "check TB"
        check_who_use_TB()
        time.sleep(30)
