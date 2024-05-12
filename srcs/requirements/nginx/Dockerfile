FROM debian:latest

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

CMD ["nginx", "-g", "daemon off;"]
