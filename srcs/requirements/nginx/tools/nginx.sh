#!/bin/bash

#chown -R  777 /etc/nginx/ssl
#chmod -R 600 /etc/nginx/ssl
#openssl req -x509 -nodes -keyout /etc/nginx/ssl/jocorrea.key -out $CERT -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=jocorrea.42.fr/UID=jocorrea"
#chmod 755 /var/www/html
#echo "
#server {
#    listen 80 ssl;
#    listen [::]:80 ssl;"> /etc/nginx/sites-available/default

 #   server_name www.$DOMAIN_NAME $DOMAIN_NAME;

 #   ssl_certificate $CERT;
 #    ssl_certificate_key /etc/nginx/ssl/jocorrea.key;" 


#echo '
#    ssl_protocols TLSv1.3;

#    index index.php;
#    root /var/www/html;

#    location ~ [^/]\.php(/|$) {
#            try_files $uri =404;
#            fastcgi_pass wordpress:9000;
#            include fastcgi_params;
#            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#        }
#} ' >>  /etc/nginx/sites-available/default


nginx -g daemon off;
