#!/bin/sh
#  > /dev/null 2>&1

until mysql -h mariadb    \
        -u ${wp_DB_USER}    \
        -p${wp_DB_PASSWORD} \
        -e "SELECT 1"; do
  echo "Waiting for MariaDB to be ready..."
  sleep 3
done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Creating WordPress configuration file..."
    # wp core download --path='/var/www/wordpress/'
    # wp core install --path='/var/www/wordpress/'
    wp config create --allow-root \
        --dbname="${wp_DB_NAME}" \
        --dbuser="${wp_DB_USER}" \
        --dbpass="${wp_DB_PASSWORD}" \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress/'
else
    echo "WordPress configuration file already exists"
fi

exec /usr/sbin/php-fpm83 -F