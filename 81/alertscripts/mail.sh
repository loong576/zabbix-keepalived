#!/bin/bash
FILE=/etc/zabbix/alertscripts/mailtmp.txt
echo "$3" >$FILE
dos2unix -k $FILE
cat $FILE|/bin/mail -s "$2" $1
