#!/router/bin/python
import re
import os

vt = "/opt/vde/services/instances/vde_latest/bin/vde_tool "
vtn = vt + "--Vno_sync "

filename = raw_input("Enter file name contain DDTS need to be deleted: ")
f = open(filename, 'r')
alllines = f.readlines()
f.close()

for eachline in alllines:
    print eachline
    items = eachline.split(" ")
    for it in items:
        if re.match('^jelou\w*', it):
            viewname = it
            print(vtn + " cc_rmview -f -ns -view " + viewname + " -vob /vob/ios")
            os.system(vtn + "cc_rmview -f -ns -view " + viewname + " -vob /vob/ios")

