#!/usr/bin/env bash
## This is for plugins that are not in the wordpress repository or from an external source.

echo "Running extra wp-cli tasks:"

wp plugin install https://github.com/WP-API/Basic-Auth/archive/master.zip
wp plugin activate Basic-Auth-master

wp plugin install https://github.com/Afrozaar/wp-api-v2-client-java-meta-plugin/archive/master.zip
wp plugin activate wp-api-v2-client-java-meta-plugin-master
#wp plugin install https://github.com/Afrozaar/wp-api-v2-afrozaar-extras/archive/master.zip
#wp plugin activate wp-api-v2-afrozaar-extras-master

echo "Done running extra wp-cli tasks."
