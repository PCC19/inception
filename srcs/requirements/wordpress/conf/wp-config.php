<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'WORDPRESS' );

/** Database username */
define( 'DB_USER', 'db_user' );

/** Database password */
define( 'DB_PASSWORD', 'imdb_user' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '|dK2d?g{R-7BU1K&.2c,~#e)@5# ~QpSiz[}oh^zQIEzD$%P<?v2Q>_~z=61)}}`' );
define( 'SECURE_AUTH_KEY',  'WUb.~f_eG/7c+V4I0LbpZyV6)2pZhjiTK%_N((.8kg?%Gnk}2E%2Na8xh!B?4Sbs' );
define( 'LOGGED_IN_KEY',    'P+2yoE6.mjy.:s`_%r>gb9<oW)lSb@kzQ~vFt`<sc*>&-4IN1,mYsKf64QixLu4]' );
define( 'NONCE_KEY',        '.h_y07H u&.s@Wnkdy{DADODOKH@(7o]]o?XhwSkp*1/eh~f>ZO,`o ~P^_uoqK=' );
define( 'AUTH_SALT',        'L~cPxQE@?lQoyh59P$,2gI{buLry9TCHf{Rp3 v8&x2HOV9B+ rZsJ2V8odi.TM9' );
define( 'SECURE_AUTH_SALT', 'x*0TM00e_5*K$x ~PC<`boZ.F4YGBCC{d?,r$9mmz[jb!QJhHjz.jR!=Q~&+tPl3' );
define( 'LOGGED_IN_SALT',   'rJ?i=v[taD,@}d6JMQAi!rq6?D#EcuFNGpg;/m/`8cLYU-ntYjf{t/xNTP[Ppt5-' );
define( 'NONCE_SALT',       'e6]&2N|Um^?RFl@mW<.KP5h?%y!_~9xdX[oq|_#~(DgsGu@?@C!A^D}h^VhK:~!g' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

