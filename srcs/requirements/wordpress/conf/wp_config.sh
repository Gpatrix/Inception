#!/bin/sh

sleep 6

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Creating WordPress configuration file..."
    wp config create --allow-root \
        --dbname="${SQL_DATABASE}" \
        --dbuser="${SQL_USER}" \
        --dbpass="${SQL_PASSWORD}" \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'
else
    echo "WordPress configuration file already exists"
fi

exec /usr/sbin/php-fpm83", "-F"