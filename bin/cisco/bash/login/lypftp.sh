#!/usr/bin/expect -f

set IP "10.74.58.208"

spawn telnet $IP
expect_after eof { exit 0 }

expect "login:"
send "jelou\n"


expect "Password:"
send "lab123\n"

#interact


expect "*$*"
send "ls -l \r"

send "exit\r"
expect eof
exit
