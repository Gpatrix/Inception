FROM alpine:3.20

WORKDIR /var/www

RUN apk update
RUN apk add wget php82 php82-fpm php82-mysqli --no-cache

# TODO only for debug
RUN apk add zsh git curl --no-cache
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY . .

ARG WP_FILE="wordpress-6.7.2.tar.gz"

RUN wget "https://wordpress.org/${WP_FILE}"
RUN tar -xzvf ${WP_FILE}
RUN rm -f ${WP_FILE}
RUN chown -R root:root /var/www/wordpress

COPY ./conf/php.ini /etc/php82/

EXPOSE 9000

ENTRYPOINT ["sleep", "infinity"]