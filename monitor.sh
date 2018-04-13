#!/bin/bash

if [ ! -e "/usr/local/thunder/etc/thunder_mounts.cfg" ]
then
  cp /usr/local/thunder/thunder_mounts.cfg /usr/local/thunder/etc/
fi

./portal
pid=
trap '[[ $pid ]] && kill $pid; ./portal -s; exit 0' SIGINT SIGTERM
while :
do 
	sleep 60 & pid=$!
	wait
	pid=

	# 监控重启
        ps -fe | grep ETMDaemon | grep -v grep
        if [ $? -ne 0 ]
        then
                echo "start process....."
                ./portal
        else
                echo "runing....."
        fi
done