#!/router/bin/python

import re
import subprocess
import datetime
import socket
import time
import os
from ftplib import FTP



tb_ws='/ws/jelou/playground/cache/TB'
os.chdir(tb_ws)
print os.getcwd()


ftp = FTP('10.74.58.208')
ftp.login('jelou','lab123')
ftp.cwd('TB_check')
ftp.retrlines('LIST')
filenames = ftp.nlst()
for filename in filenames:
#    local_filename=tb_wb+'/'+filename
    local_filename = filename
    file = open(local_filename, 'w')
    ftp.retrbinary('RETR '+filename, file.write)
    file.close()
ftp.close()


all_con = open('AllTBConnection', 'w')

for dirpath , dirname, files in os.walk(tb_ws):
    for file in files:
        print file + "is under" + dirpath
        f = open(file,'r')
        lines = f.readlines()
        for line in lines:
            newline = file + " " + line
            print  newline
            all_con.write(newline)
        f.close()
all_con.close()

