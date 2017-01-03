#!/bin/bash
# This script helps automate the process of download and set of of Bamboo on an AWS Linux instance, as part of setting up Atlassian’s Continuous Integration toolset
sudo yum update
sudo yum groupinstall -y 'Web Server' 'MySQL Database' 'PHP Support'
sudo yum install -y php-mysql
sudo service httpd start
sudo chkconfig httpd on
chkconfig -list httpd
sudo service mysqld start
sudo mysql_secure_installation
mysql -u root -p
CREATE DATABASE bamboo CHARACTER SET utf8 COLLATE utf8_bin
GRANT ALL PRIVILEGES ON bamboo.* TO 'bamboouser'@'localhost' IDENTIFIED BY 'bamboopassword'
FLUSH PRIVILEGES;
wget http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-5.3.tar.gz
tar -zxvf atlassian-bamboo-5.3.tar.gz
cd atlassian-bamboo-5.3/atlassian-bamboo/WEB-INF/classes/
vi bamboo-init.properties
