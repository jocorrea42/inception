FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
RUN mkdir /etc/nginx/ssl

#COPY ./tools/nginx.sh /.

#RUN chmod +x nginx.sh
RUN mkdir -p /run/nginx
CMD ["nginx", "-g", "daemon off;"]
