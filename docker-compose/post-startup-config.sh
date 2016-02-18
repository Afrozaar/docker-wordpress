#!/usr/bin/env bash

/usr/bin/mysqld_safe & sleep 7s

echo "setting up config before launching wordpress..."
echo "WP_PATH: $WP_PATH"
echo "setting siteurl to $SITE_URL"
echo "setting home to $SITE_URL"

wp --path="$WP_PATH" --allow-root option update siteurl "$SITE_URL"
wp --path="$WP_PATH" --allow-root option update home "$SITE_URL"
wp --path="$WP_PATH" --allow-root theme activate "$WP_THEME"

killall mysqld && sleep 5s

supervisord -n
