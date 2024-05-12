FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

CMD ["nginx", "-g", "daemon off;"]
