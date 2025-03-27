#!/bin/sh

until mariadb -h mariadb    \
        -u ${wp_DB_USER}    \
        -p${wp_DB_PASSWORD} \
        -e "SELECT 1" > /dev/null 2>&1; do
  echo "Waiting for MariaDB to be ready..."
  sleep 3
done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Creating WordPress configuration file..."
    wp config create --allow-root \
                     --dbname="${SQL_DATABASE}" \
                     --dbuser="${wp_DB_USER}" \
                     --dbpass="${wp_DB_PASSWORD}" \
                     --dbhost=mariadb:3306 \
                     --path='/var/www/wordpress/'

    wp core install --url="lchauvet.42.fr" \
                    --title="Inception" \
                    --admin_user="${wp_DB_USER}" \
                    --admin_password="${wp_DB_PASSWORD}" \
                    --admin_email="lchauvet@student.42lehavre.fr"  \
                    --path='/var/www/wordpress/'

    wp theme activate twentytwentythree --path=/var/www/wordpress
else
    echo "WordPress configuration file already exists"
fi

exec /usr/sbin/php-fpm83 -F