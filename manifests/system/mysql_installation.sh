#!/bin/bash

echo "Initializing/Updating MySQL databases..."
/opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql --datadir=/var/lib/mysql

echo "Putting MySQL executables into execution path..."
ln -sf /opt/mysql/server-5.6/bin/* /usr/bin
ln -sf /opt/mysql/server-5.6/bin/mysqld /usr/sbin

echo "Replacing my.cnf with the HCC version..."
mv /opt/mysql/server-5.6/my.cnf /opt/mysql/server-5.6/my.cnf.old
cp config/my.cnf /opt/mysql/server-5.6/my.cnf

echo "Changing Mysql service to use init.d directory..."
rm -rf /etc/mysql
cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysql
update-rc.d mysql defaults

echo "Starting the service..."
service mysql start

echo "Upgrade of MySQL 5.6 complete."
