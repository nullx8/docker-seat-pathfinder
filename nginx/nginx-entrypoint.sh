#!/bin/bash
set e

envsubst < /etc/nginx/nginx.conf.template '$NGINX_HOST$NGINX_ADMIN_IP' > /etc/nginx/nginx.conf

nginx -g 'daemon off;'