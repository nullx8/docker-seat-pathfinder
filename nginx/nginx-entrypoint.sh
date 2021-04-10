#!/bin/bash
set e

for f in /etc/nginx/conf.d/templates/*.conf; do
    FILENAME=$(basename $f | cut -f 1 -d '.')
    envsubst < "${f}" '$NGINX_HOST$NGINX_ADMIN_IP' > "/etc/nginx/conf.d/${FILENAME}.conf"
done

nginx -g 'daemon off;'