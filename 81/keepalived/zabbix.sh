#!/bin/bash
systemctl start zabbix-server

/etc/keepalived/exp.sh 172.27.9.82 monitor
