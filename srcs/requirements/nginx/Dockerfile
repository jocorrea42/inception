FROM	debian:buster

#install all the program
RUN		apt -y update && apt upgrade -y && apt install -y nginx openssl
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d
#COPY ./conf/default.conf /etc/nginx/conf.d
COPY ./tools/nginx.sh .
RUN chmod +x nginx.sh

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["./nginx.sh"]