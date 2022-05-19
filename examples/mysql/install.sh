#!/usr/bin/env bash

#sudo yum -y update

# if we need any dependencies, install them here

#sudo yum -y update
sudo yum -y install wget

wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm

sudo yum -y install mysql-server

# restart mysql
sudo service mysqld restart

### secure the mysql installation

# Read password
PASSWORD=$(sudo grep 'temporary password' /var/log/mysqld.log | cut --delimiter=":" -f4 | xargs)
echo $PASSWORD

export NEWPASSWORD=MyNewPassword0851!
# set root password
sudo /usr/bin/mysqladmin -u root -p$PASSWORD password '$NEWPASSWORD'

# allow remote access
mysql -u root -p$NEWPASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"

# drop the anonymous users
mysql -u root -p$NEWPASSWORD -e "DROP USER ''@'localhost';"
mysql -u root -p$NEWPASSWORD -e "DROP USER ''@'$(hostname)';"

# drop the demo database
mysql -u root -p$NEWPASSWORD -e "DROP DATABASE test;"

# flush
mysql -u root -p$NEWPASSWORD -e "FLUSH PRIVILEGES;"

# create database and user
mysql -u root -p$NEWPASSWORD -e "create database db1;"
mysql -u root -p$NEWPASSWORD -e "CREATE USER 'user1'@'localhost' IDENTIFIED BY 'User1234!';"
mysql -u root -p$NEWPASSWORD -e "GRANT ALL PRIVILEGES ON * . * TO 'user1'@'localhost';"

# restart
sudo service mysqld restart

# set to autostart
sudo chkconfig mysqld on

# Install tomcat
sudo yum -y install tomcat
sudo chkconfig tomcat on
sudo service tomcat start

# Deploy war files
sudo cp /vagrant/*.war /var/lib/tomcat/webapps
