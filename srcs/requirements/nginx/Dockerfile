FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
COPY conf/nginx.conf /home/jocorrea/nginx.conf
COPY ./tools/nginx.sh /
RUN chmod +x nginx.sh
CMD [ "/nginx.sh" ]