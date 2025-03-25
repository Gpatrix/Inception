FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update --no-cache
RUN apk add nginx openssl --no-cache

RUN mkdir -p /etc/nginx/ssl     \
             /etc/nginx/ssl     \
             /var/run/nginx     \
             /var/www/wordpress

RUN openssl req -x509 -nodes \
-out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key \
-subj "/C=FR/ST=IDF/L=le havre/O=42/OU=42/CN=lchauvet.42.fr/UID=lchauvet"


RUN chmod 755 /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE 9000

CMD [ "nginx", "-g", "daemon off;" ]