#!/usr/bin/env bash
/usr/bin/mysqld_safe & sleep 10s
cd /var/www
PLUGINS=(rest-api wp-basic-auth)

sudo -u www-data -i env PLUGINS="`echo ${PLUGINS[@]}`" sh <<'EOF'
echo "Running wp-cli commands in `pwd` as `whoami`"
echo "wp core install..."
wp core install --url="http://example.com" --title=MyDockerizedWordPress --admin_user=docker --admin_password="docker!" --admin_email=docker@example.com

echo "Installing plugins..."
bash -c 'PLUGINS=($PLUGINS); for pl in ${PLUGINS[@]}; do echo "installing plugin $pl ..."; wp plugin install $pl; done;'
echo "done installing plugins";

echo "Listing plugins:"
wp plugin list
EOF

killall mysqld && sleep 5s
