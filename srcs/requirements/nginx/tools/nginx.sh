#!/bin/bash

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/jocorrea.crt \
       -keyout /etc/nginx/ssl/jocorrea.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=jocorrea/CN=jocorrea/"
mkdir -p /run/nginx
nginx -g "daemon off;"