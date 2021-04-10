#!/bin/bash
set e

rm /etc/nginx/conf.d/default.conf

for f in /etc/nginx/conf.d/templates/*.conf; do
    FILENAME=$(basename $f | cut -f 1 -d '.')
    envsubst < "${f}" '$NGINX_DOMAIN$NGINX_ADMIN_IP' > "/etc/nginx/conf.d/${FILENAME}.conf"
done

nginx -g 'daemon off;'