#!/usr/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

#1.定义变量
Host=$(hostname)
Addr=$(ifconfig eth1|awk 'NR==2{print $2}')
Date=$(date +%F)
Dest=${Host}_${Addr}_${Date}
Path=/backup
#2.创建备份目录
[ -d $Path/$Dest ] || mkdir -p $Path/$Dest

#3.备份对应的文件
cd / && \
[ -f $Path/$Dest/system.tar.gz ] || tar czf $Path/$Dest/system.tar.gz etc/fstab etc/rsyncd.conf && \
[ -f $Path/$Dest/log.tar.gz ] || tar czf $Path/$Dest/log.tar.gz  var/log/messages var/log/secure && \

#4.携带md5验证信息
[ -f $Path/$Dest/${Date}.flag ] || md5sum $Path/$Dest/*.tar.gz >$Path/$Dest/${Date}.flag

#5.推送本地数据至备份服务器
export RSYNC_PASSWORD=1
rsync -avz $Path/ rsync_backup@172.16.1.41::backup >/dev/null

#6.本地保留最近7天的数据
find $Path/ -type d -mtime +7|xargs rm -rf
