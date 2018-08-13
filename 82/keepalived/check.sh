#!/bin/bash
zabbix_server=`ps -C zabbix_server --no-header | wc -l`
mysqld=`ps -C mysqld --no-header | wc -l`
case $1 in
    zabbix_server)
        if [ $zabbix_server -gt 0 ];then
            exit 0 
        else
            exit 1
        fi
    ;;
    mysqld)
        if [ $mysqld -gt 0 ];then
            exit 0
        else
            exit 1 
        fi
    ;;
esac
