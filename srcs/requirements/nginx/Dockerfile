FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD [ "./tools/nginx.sh" ]