 #!/router/bin/python

 import os
 import subprocess
 import re
 vt = "/opt/vde/services/instances/vde_latest/bin/vde_tool "
 vtn = vt + "--Vno_sync "

 cmd = vtn + "ct lsco -short -me -avobs -cview | tee checkout_file"

 cur_pwd = os.getcwd();
 m = re.search ('(CSC.*[0-9]{5}).*', str(cur_pwd))
 ddts = m.group(1)
 print "currrent path is " + cur_pwd + " DDTS " + ddts
 os.system(cmd)

 f =open('checkout_file', 'r')
 alllines = f.readlines()

 f.close()
 for file in alllines:
         uncofilecmd=vtn + " cc_unco -rm " + file
             print "uncheck out round 1" + file
                 os.system(uncofilecmd)


                     cofilecmd = vtn + " cc_co -nc -bug " + ddts + " " + file

                         print "check out " + file + cofilecmd
                             os.system(cofilecmd)

                                 print "syn out " + file
                                     syncoutcmd = vt + " sync_out " + file
                                         os.system(syncoutcmd)

                                             print "sync in " + file
                                                 syncincmd = vt + " sync_in " + file
                                                     os.system(syncincmd)

                                                         print "uncheck out round 2" + file
                                                             uncofilecmd=vtn + " cc_unco -rm " + file
                                                                 print uncofilecmd

