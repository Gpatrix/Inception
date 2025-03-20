FROM alpine:3.20

WORKDIR /usr/src/Inception  

RUN apk update
RUN apk add lighttpd php82 fcgi php82-cgi wget --no-cache

# TODO only for debug
RUN apk add zsh git curl --no-cache
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY . .

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN << EOF
    # cd wordpress \
    # mv wp-config-sample.php wp-config.php

EXPOSE 9000

ENTRYPOINT ["sleep", "infinity"]