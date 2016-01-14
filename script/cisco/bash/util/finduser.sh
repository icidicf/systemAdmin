#!/usr/bin/bash

ps -ef | grep telnet | grep "con-102 2019"

if [ $? == 0 ]
then
    echo "found NG09 user"
fi


if [ $? == 0 ]
then
    ps -ef | grep telnet | grep "con-31 2050"
fi

ps -ef | grep telnet | grep "con-31 2050"
if [ $? == 0 ]
then
    echo "found f04 user"
fi


ps -ef | grep telnet | grep "con-10 2033"
if [ $? == 0 ]
then
    echo "found f05 user"
fi


ps -ef | grep telnet | grep "con-38 2003"
if [ $? == 0 ]
then
    echo "found f07 user"
fi


ps -ef | grep telnet | grep "con-104 2010"
if [ $? == 0 ]
then
    echo "found test ter"
fi

