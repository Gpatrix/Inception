FROM alpine:3.20.6

WORKDIR /var/www

RUN apk update --no-cache
RUN apk add wget php83 php83-fpm php83-mysqli php83-iconv php-phar openssl mariadb-client --no-cache

ARG WP_FILE="wordpress-6.7.2.tar.gz"

RUN wget "https://wordpress.org/${WP_FILE}"
RUN tar -xzvf ${WP_FILE}
RUN rm -f ${WP_FILE}
RUN chown -R root:root /var/www/wordpress
RUN adduser -D -G www-data -u 82 www-data

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY ./conf/php.ini /etc/php82/
COPY ./tool/wp_config.sh .

EXPOSE 9000
ENTRYPOINT ["sh", "wp_config.sh"]
