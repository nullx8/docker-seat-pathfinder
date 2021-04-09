FROM nginx:1.19.9

COPY ./nginx-entrypoint.sh /nginx-entrypoint.sh
COPY h5bp /etc/nginx/h5bp
RUN chmod +x /nginx-entrypoint.sh

ENTRYPOINT ["/nginx-entrypoint.sh"]