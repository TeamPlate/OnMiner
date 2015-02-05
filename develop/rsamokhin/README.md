# Tomcat Deployment

1. echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
2. echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
3. apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
4. apt-get update
5. apt-get install oracle-java8-installer
6. apt-get install oracle-java8-set-default
7. cd /tmp
8. wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.0.18/bin/apache-tomcat-8.0.18.tar.gz
9. tar xvzf apache-tomcat-8.0.18.tar.gz
10. rm apache-tomcat-8.0.18.tar.gz
11. mv apache-tomcat-8.0.18/ /opt/tomcat
12. nano ~/.bashrc (export JAVA_HOME=/usr/lib/jvm/java-8-oracle/     export CATALINA_HOME=/opt/tomcat)
13. . ~/.bashrc
14. nano /etc/rc.local
15. iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 8080
16. apt-get install chkconfig
17. nano /etc/init.d/tomcat (-> tomcat.txt)
18. nano /etc/local
19. /etc/init.d/tomcat start
20. apt-get install git
21. mkdir /prj && cd prj
22. git clone https://github.com/TeamPlate/OnMiner.git
23. cd /opt/tomcat/webbaps && ln -s /prj/OnMiner/develop/rsamokhin/
24. nano /etc/crontab
25. *  *    * * *   root    cd /prj/OnMiner && git pull



