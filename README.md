# zabbix-keepalived
inotify+rsync+mysql主主复制+keepalived实现zabbix高可用


思路：主备机通过inotify+rsync实现文件同步，通过mysql主主复制实现数据同步，同一时刻只有一台服务器能对外提供zabbix服务，web端登陆虚ip访问，被监控主机通过配置虚ip来完成监控。

文章链接：http://blog.51cto.com/3241766/2137303
