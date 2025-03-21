FROM alpine:3.20

WORKDIR /var/www

RUN apk update
RUN apk add wget php83 php83-fpm php83-mysqli php-phar openssl --no-cache

ARG WP_FILE="wordpress-6.7.2.tar.gz"

RUN wget "https://wordpress.org/${WP_FILE}"
RUN tar -xzvf ${WP_FILE}
RUN rm -f ${WP_FILE}
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG wp_AUTH_KEY
ARG wp_SECURE_AUTH_KEY
ARG wp_LOGGED_IN_KEY
ARG wp_NONCE_KEY
ARG wp_AUTH_SALT
ARG wp_SECURE_AUTH_SALT
ARG wp_LOGGED_IN_SALT
ARG wp_NONCE_SALT

COPY ./conf/php.ini /etc/php82/
COPY ./conf/wp_config.sh .
RUN sh wp_config.sh
RUN rm -f wp_config.sh

EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm83", "-F"]
