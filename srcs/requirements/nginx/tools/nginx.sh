#!/bin/bash

mkdir -p /home/jocorrea/ssl
mkdir -p /home/jocorrea/nginx
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=CA/L=Barcelona/O=42/OU=42/CN=jocorrea.42.ba/UID=jocorrea"
chmod 755 /var/www/html
chown -R www-data:www-data /var/www/html
nginx -g "daemon off;"