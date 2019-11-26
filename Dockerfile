FROM alpine:3.10

RUN apk -U add dumb-init nginx \
    && rm -rf /etc/nginx/conf.d

COPY nginx.conf /etc/nginx/nginx.conf
COPY html /var/www/localhost/htdocs/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD "/usr/sbin/nginx"
