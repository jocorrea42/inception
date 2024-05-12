FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
RUN chmod +x ./tools/nginx.sh
CMD ["./tools/nginx.sh"]
