FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add nginx

COPY . .

COPY index.html /data/www/
COPY index.html /data/up1/
COPY nginx.conf /usr/local/nginx/conf/


# reload config fil
# RUN nginx -s reload

EXPOSE 443
# ENTRYPOINT ["ls", "-alR"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]