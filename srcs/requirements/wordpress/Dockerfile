FROM alpine:3.20

WORKDIR /var/www

RUN apk update
RUN apk add wget php82 php82-fpm php82-mysqli --no-cache

ARG WP_FILE="wordpress-6.7.2.tar.gz"

RUN wget "https://wordpress.org/${WP_FILE}"
RUN tar -xzvf ${WP_FILE}
RUN rm -f ${WP_FILE}
RUN chown -R root:root /var/www/wordpress

COPY ./conf/php.ini /etc/php82/
COPY ./conf/wp_config.sh .
RUN chmod +rx wp_config.sh

EXPOSE 9000

ENTRYPOINT ["sh", "wp_config.sh"]
