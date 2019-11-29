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

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'c2y-Y._5?`}Hk-`0~Rw>H!t3Op]s;pV`E/p_Ao90*9nRI?oPPDtwzk(q> W9<Gw2' );
define( 'SECURE_AUTH_KEY',  'LC~^sR8?(CgW4i(}|sR:AVCM.K^nD@uisN|*fA]$b}k2RYvY=QNYmvOhEcY2h[Hk' );
define( 'LOGGED_IN_KEY',    'Ym_vl^wZy3V;SCx]=_6ub@XwCwljZ`tTN7I$p4& yRr,KxYNWgFGGe];xek. 7ir' );
define( 'NONCE_KEY',        '^ObU<F_$Lw^1 S.?NoT}S=AVN Zh<Jos2h;1R.m`{^b$O$$e.?~gzUz[IF(B>IK#' );
define( 'AUTH_SALT',        'bF8$l7q_kRlgFDlF@D@zb) eWAy%>J(dx$rVwpRFq!^Vgu4,djNuL*JOJLDx7gqN' );
define( 'SECURE_AUTH_SALT', 'I5EXJ:-d+{dcMJUCgzlv9IE``N}?tG|aRf=`I6Fx uwr|!ww&tw4rJ^(Is~5)0<m' );
define( 'LOGGED_IN_SALT',   '%Z:zez~9<1hXF&vG:u,@)6(nOPH.#i>fZ@@NQR5QjV:Vt,~&N(|x(O5`({fG$|} ' );
define( 'NONCE_SALT',       'OC.|1$SGsNP8zN@]jY =1A0wP!($:6VgUB9Dg_KiB}jO*K=SYGF:pfj@Hz&#_76G' );

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
