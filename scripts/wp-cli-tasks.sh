#!/usr/bin/env bash
/usr/bin/mysqld_safe & sleep 10s
cd /var/www

. /wp-plugins.sh

sudo -u www-data -i env PLUGINS="`echo ${PLUGINS[@]}`" sh <<'EOF'
echo "Running wp-cli commands in `pwd` as `whoami`"
echo "wp-cli core install:"
wp core install --url="http://docker.dev" --title=MyDockerizedWordPress --admin_user=docker --admin_password="docker!" --admin_email=docker@docker.dev

echo "Installing plugins."
bash -c '
  PLUGINS=($PLUGINS);
  for pl in ${PLUGINS[@]}; do
    echo "installing plugin $pl ...";
    wp plugin install $pl;
    wp plugin activate $pl;
  done;
'

if [ -f /wp-cli-plugins-extra.sh ]; then
  . /wp-cli-plugins-extra.sh
fi

echo "Done installing plugins.";

echo "Listing plugins:"
wp plugin list

echo "Enabling /%postname%/ permalinks."
wp rewrite structure '/%postname%/'
EOF

killall mysqld && sleep 5s
