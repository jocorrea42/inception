#!/bin/bash
mkdir /etc/nginx/ssl
chown -R root:root /etc/nginx/ssl
chmod -R 600 /etc/nginx/ssl
openssl req -x509 -nodes -day 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/jocorrea.key -out $CERT -subj "/C=ES/ST=CA/L=Barcelona/O=42/OU=42/CN=jocorrea.42.ba/UID=jocorrea"
chmod 755 /var/www/html
chown -R www-data:www-data /var/www/html
echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate $CERT;
    ssl_certificate_key /etc/nginx/ssl/jocorrea.key;" > /etc/nginx/sites-available/default


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
