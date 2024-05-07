#!/bin/bash

openssl req -x509 -nodes -newkey rsa:2048 -keyout etc/ssl/private/nginx-selfsigned.key -out $CERT -subj "/C=ES/ST=CA/L=Barcelona/O=42/OU=42/CN=jocorrea.42.ba/UID=jocorrea"
chmod 755 /var/www/html
chown -R www-data:www-data /var/www/html
echo "
echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    #server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate $CERT;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/sites-available/default


echo '
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ [^/]\.php(/|$) { 
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
} ' >>  /etc/nginx/sites-available/default


nginx -g "daemon off;"