FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add nginx openssl --no-cache

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
-out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lchauvet.42.fr/UID=lchauvet"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/run/nginx

EXPOSE 443
EXPOSE 9000

CMD [ "nginx", "-g", "daemon off;" ]