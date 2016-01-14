#!/usr/bin/expect



if { $argc == 1 } {
        set ddts [lindex $argv 0]
    } else {
        set ddts DDTS
}


send_user "ddts is $ddts\n"

spawn ssh 10.74.59.217

expect "*password:"
send "lab123\n"


expect "*$*"
send "pwd\r"

expect "*$*"
send "cd /tftpboot/jelou\r"

interact


