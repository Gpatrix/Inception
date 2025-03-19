FROM alpine:3.20

WORKDIR /usr/src/Inception

RUN apk update
RUN apk add nginx


# TODO for debug
RUN apk add zsh git curl
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY . .

COPY index.html /data/www/
COPY index.html /data/up1/
COPY nginx.conf /etc/nginx/


# reload config fil

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# RUN nginx -s reload