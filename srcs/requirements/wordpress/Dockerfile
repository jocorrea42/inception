FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	# php-pdo \
	php-gd php-cli \
	# php-mbstring \
	# redis \
	# php-redis \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /etc/php/7.3/fpm/pool.d/www.conf \
	&& mkdir  -p /run/php

# Copy the .conf in the html directory
COPY ./conf/wordpress.conf /etc/php/7.3/fpm/pool.d/www.conf

#Create the folder to enable php start

#we copy the script, give the right to launch it in local on our computer
COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm7.3", "-F"]

