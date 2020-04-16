#!/bin/bash
# ES的守护进程，发现es挂掉就拉起来
while true
do
#  pid=`ps aux | grep 'elasticsearch/lib' | grep -v 'grep' | awk '{print$2}'`
  pid=`ps aux | grep 'startES.sh' | grep -v 'grep' | awk '{print$2}'`
  if [ ${pid} > 0 ]
  then
    echo "es is running, pid:"${pid}
  else
    echo "es is not running"
    ./startES.sh > /dev/null 2>&1 &
    echo "starting es..."
    sleep 3
  fi
  sleep 3
done
