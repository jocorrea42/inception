#!/bin/bash
#mkdir /var/www/
#mkdir /var/www/html
#cd /var/www/html
#rm -rf *
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#chmod +x wp-cli.phar
#./wp-cli.phar core download --allow-root
#./wp-cli.phar config create --dbname=wordpress --dbuser=test --dbpass=12345 --dbhost=mariadb --allow-root
#./wp-cli.phar core install --url=localhost --title=inception --admin_user=jocorrea --admin_password=12345 --admin_email=jocorrea@42.fr --allow-root

sed -i 's/listen = wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
#cp /home/jocorrea/www.conf /etc/php/7.3/pool.d/www.conf
mkdir /run/php

#wp redis enable --allow-root
/usr/sbin/php-fpm7.3 -F
