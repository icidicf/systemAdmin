#!/usr/bin/expect


if { $argc == 1 } {
    set ddts [lindex $argv 0]
} else {
    set ddts DDTS
}


send_user "ddts is $ddts\n"

spawn ssh 10.74.59.217

expect "*password:"
send "lyp5547069\n"


expect "*$*"
send "pwd\r"

expect "*$*"
send "cd /tftpboot/jelou\r"


if { ${ddts} != "DDTS" } {
     send_user "dir is  ${ddts} \n"
     expect "*$*"
     send "mkdir -p ${ddts}\r"
     expect "*$*"
     send "cd  ${ddts}\r"
     expect "*$*"
     send "rm *\r"
} else {
    send_user "dir is DDTS\n"
}
#interact


     expect "*$*"
     send "exit\r\n"
     expect eof
     exit
