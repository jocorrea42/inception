FROM debian:buster

RUN apt update -y && apt install php-fpm php-mysql -y
RUN apt install curl -y
#RUN mkdir /home/jocorrea/inception-git/srcs/requirements/wordpress/data

#COPY ./tools/wordpress.sh /
#COPY ./conf/wp-config.php /
#RUN chmod +x wordpress.sh
RUN mkdir /run/php
CMD ["/usr/sbin/php-fpm7.3", "-F"]
