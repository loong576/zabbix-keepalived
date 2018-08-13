#!/bin/bash
ZabbixPath=/etc/zabbix/
WebPath=/etc/httpd/conf/
WebPath2=/etc/httpd/conf.d/
Server=172.27.9.81

/usr/bin/inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e close_write,delete,create,attrib,move  $WebPath $WebPath2 $ZabbixPath |
while read line
do
    if [[ $line =~ $ZabbixPath ]];then
    rsync -vzrtopg --progress --delete  $ZabbixPath  root@$Server::zabbix  --password-file=/etc/rsyncd.pwd2
    elif [[ $line =~ $WebPath2 ]];then
    rsync -vzrtopg --progress --delete  $WebPath2  root@$Server::web2  --password-file=/etc/rsyncd.pwd2
    elif [[ $line =~ $WebPath ]];then
    rsync -vzrtopg --progress --delete  $WebPath  root@$Server::web1  --password-file=/etc/rsyncd.pwd2
    else
    echo $line >> /var/log/inotify.log
    fi
done
