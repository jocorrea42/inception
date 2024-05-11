FROM debian:buster

RUN apt update -y && apt install php-fpm php-mysql -y
RUN apt install curl -y

COPY ./tools/wordpress.sh /
#COPY ./conf/wp-config.php /
RUN chmod +x wordpress.sh

CMD ["./wordpress.sh"]
