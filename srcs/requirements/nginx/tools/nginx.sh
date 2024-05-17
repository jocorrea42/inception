#!/bin/bash

mkdir -p /etc/nginx/ssl
mkdir -p /run/nginx

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out $CERTS_CRT \
       -keyout $CERTS_KEY \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU='${MYSQL_USER}'/CN='${DOMAIN_NAME}'/"
       
sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/conf.d
sed -i 's|WP_PATH|'${WP_PATH}'|g' /etc/nginx/conf.d
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/conf.d
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/conf.d
sed -i 's|CERTS_KEY|'${CERTS_KEY}'|g' /etc/nginx/conf.d
sed -i 's|CERTS_CRT|'${CERTS_CRT}'|g' /etc/nginx/conf.d
nginx -g "daemon off;"