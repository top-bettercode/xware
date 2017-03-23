#!/bin/bash
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