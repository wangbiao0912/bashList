echo  准备执行脚本

kill `jps -l | grep dial-plan- | awk '{print $1}'`
nohup java -jar dial-plan-0.0.1-SNAPSHOT.jar &

echo 执行脚本完成
