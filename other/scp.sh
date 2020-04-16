#! /bin/sh
mvn clean package
expect -c "
    spawn scp -r /Users/wangbiao/work/hzjy/haiNanDianXin/source/code/dial-system/dial-plan/target/dial-plan-0.0.1-SNAPSHOT.jar root@ip地址:/usr/local/spring-boot/dial-system/dial-plan/
    expect {
        \"*assword\" {set timeout 20; send \"密码\r\"; exp_continue;} #此处的jello为密码，自行替换
    }
expect eof"
