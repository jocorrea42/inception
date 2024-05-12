FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
COPY ./tools/nginx.sh /.
RUN chmod +x nginx.sh
CMD ["./nginx.sh"]
