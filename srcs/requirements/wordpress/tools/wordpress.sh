#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

####### MANDATORY PART ##########

	#Download wordpress and all config file
	# wget http://wordpress.org/latest.tar.gz
	# tar xfz latest.tar.gz
	# mv wordpress/* .
	# rm -rf latest.tar.gz
	# rm -rf wordpress
	# I need to install wp_cli command and put it in the right directory /usr/local/bin
  	#Inport env variables in the config file
	# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	# cp wp-config-sample.php wp-config.php

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  	chmod +x wp-cli.phar
  	mv wp-cli.phar /usr/local/bin/wp
	#CONFIG
 	wp core download --path=$WP_PATH --allow-root
 	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=$WP_PATH --skip-check --allow-root
  	wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root
 	wp theme install teluro --path=$WP_PATH --activate --allow-root
  	wp user create correa correa@gmail.com --role=author --path=$WP_PATH --user_pass=12345 --allow-root

	
###################################

####### BONUS PART ################

## redis ##

#	wp config set WP_REDIS_HOST redis --allow-root #I put --allowroot because i am on the root user on my VM
#  	wp config set WP_REDIS_PORT 6379 --raw --allow-root
# 	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
#  	#wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
# 	wp config set WP_REDIS_CLIENT phpredis --allow-root
#	wp plugin install redis-cache --activate --allow-root
#    wp plugin update --all --allow-root
#	wp redis enable --allow-root

###  end of redis part  ###

###################################
fi

exec "$@"
