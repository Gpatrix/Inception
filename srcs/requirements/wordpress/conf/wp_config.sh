#!/bin/sh

<< EOF cat > wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );

define( 'DB_USER', '${DB_USER}' );

define( 'DB_PASSWORD', '${DB_PASSWORD}' );

define( 'DB_HOST', 'mariadb:3306' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('AUTH_KEY',         '${wp_AUTH_KEY}');
define('SECURE_AUTH_KEY',  '${wp_SECURE_AUTH_KEY}');
define('LOGGED_IN_KEY',    '${wp_LOGGED_IN_KEY}');
define('NONCE_KEY',        '${wp_NONCE_KEY}');
define('AUTH_SALT',        '${wp_AUTH_SALT}');
define('SECURE_AUTH_SALT', '${wp_SECURE_AUTH_SALT}');
define('LOGGED_IN_SALT',   '${wp_LOGGED_IN_SALT}');
define('NONCE_SALT',       '${wp_NONCE_SALT}');

'$table_prefix' = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
EOF

mv ./wp-config.php ./wordpress/

/usr/sbin/php-fpm82 -F