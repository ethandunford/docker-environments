<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */


/*
    stupid hack because wordpress doesn't understand reverse proxies
    and for some obessed with hard coding values!
*/ 

// 0 = https disabled
// 1 = https enabled
$_SERVER["HTTPS"] = '0';

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', getenv('DB_HOST') );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'FS_METHOD', 'direct' );
define( 'WP_DEBUG', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

 define('AUTH_KEY', 'Bj+ct#%8IwZb|zKQWo=-U qaX +IIBT>Rn>G0nu.ZUa;F|#d{RCn.jbRi]RAS tN');
define('SECURE_AUTH_KEY', 'QpYj6,(LJlu(n@{u6V*kT6E~(m}%iLh_!L&DcY*tMHi %(Px!VF?/7p{Q!gy?Qgb');
define('LOGGED_IN_KEY', '_4]5;)Q-$t(eo8UsVwtMzxW3bDO.V8:vyNdb~m%!,|_WaBGn:_(+1C3.^A/>RY m');
define('NONCE_KEY', '3R7|CB-J0e=ralQ2HwZ1?JR~&AiY&SNLSeM8}<k6i%^AH2|`-CYm[|lxQ4&V7KxZ');
define('AUTH_SALT', 'Dw[U1uHgaW[5kqqU-Ms*J-zT/b|V0qW9=gnxV{){z6a@ikCyBj:L^hwrsVYu &VS');
define('SECURE_AUTH_SALT', 's?_kQQG@sR6Q/gZ:o+Zw2-v_SF q!SKYT-`Hybg|5F5H}k94$@_/PWfF->L*MRB|');
define('LOGGED_IN_SALT', '[!Nk}>9|Yh#]+sO!YfzzkUIzjzRlCp-4b&HUjkIq6<S.(e-xGAJiVP^|aaoq%zYD');
define('NONCE_SALT', 'd{w=qiE*.4z.:%xJ? 82yfvt|(Nt)8Xm2:4>qP#-KY6+LTp-Ai<!|d2o!8*J,COG');


/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
