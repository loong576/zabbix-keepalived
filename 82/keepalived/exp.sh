#!/usr/bin/expect -f
set ip [lindex $argv 0 ]
set password [lindex $argv 1 ]
set timeout 10
spawn ssh root@$ip
expect {
"*yes/no" { send "yes\r"; exp_continue}
"*password:" { send "$password\r";exp_continue }
}
expect "#*"  
send "pkill -9 zabbix\r"  
send  "exit\r"  
expect eof
