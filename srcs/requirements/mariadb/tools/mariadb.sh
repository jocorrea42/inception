#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%' WITH GRANT OPTION;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
mysql < db1.sql
kill $(cat /var/run/mysqld/mysqld.pid)
mysqld --bind-adress=0.0.0.0