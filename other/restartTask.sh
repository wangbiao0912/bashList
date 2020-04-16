#!/usr/bin/expect
set WORK_PATH "/usr/local/spring-boot/dial-system/dial-plan/"
set hostname "182.43.229.186"
spawn ssh root@$hostname
expect {
  "yes/no"
  {send "yes\r";}
  #{send "yes\r"; exp_continue;}
  "password:"
  {exp_send "密码";}
  "password:"
  {exp_send "密码";}
}


puts "\n*****************************************************************************************************"
puts "\n                 LOGIN ${hostname} SUCCESSFULLY  START TO EXCUTE COMMAND       "
puts "\n*****************************************************************************************************"

expect "root@*"  {send "cd ${WORK_PATH}\r"}
expect "root@*"  {send "ls -lsth \r"}
# 停止java程序  kill `jps -l | grep chess-admin | awk '{print $1}'`
expect "root@*"  {send "kill `jps -l |awk '$2~"dial-plan-"{print $1}'`\r"}
expect "root@*"  {send "nohup java -jar dial-plan-0.0.1-SNAPSHOT.jar & \r"}
expect "root@*"  {send "tail -f nohup.out  \r"}
expect "root@*"  {send "exit\r"}
