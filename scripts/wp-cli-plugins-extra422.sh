#!/usr/bin/env bash
## This is for plugins that are not in the wordpress repository or from an external source.

echo "Running extra wp-cli tasks(422):"

wp plugin install https://github.com/WP-API/Basic-Auth/archive/master.zip
wp plugin activate Basic-Auth-master

echo "Done running extra wp-cli tasks."
