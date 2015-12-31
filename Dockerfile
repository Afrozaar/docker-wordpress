## johanmynhardt/wordpress
FROM johanmynhardt/ubuntu-mysql-apache-php
MAINTAINER Johan Mynhardt <johan.mynhardt@gmail.com>
COPY ./scripts/wp-*.sh /
#ADD ./scripts/wp-config.sh /wp-config.sh
#ADD ./scripts/wp-cli-tasks.sh /wp-cli-tasks.sh
ADD ./scripts/start.sh /start.sh
ADD ./scripts/foreground.sh /etc/apache2/foreground.sh
ADD ./configs/supervisord.conf /etc/supervisord.conf
ADD ./configs/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /var/www/
#ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
COPY latest.tar.gz /tmp/wordpress.tar.gz
RUN tar xvzf /tmp/wordpress.tar.gz
RUN mv /wordpress /var/www/
## CHMOD/OWN
RUN chown -R www-data:www-data /var/www/
RUN chmod 755 /wp-config.sh
RUN chmod 755 /wp-cli-tasks.sh
RUN chmod 755 /start.sh
RUN chmod 755 /etc/apache2/foreground.sh
RUN mkdir /var/log/supervisor/
EXPOSE 80
## do wp-config
RUN /wp-config.sh
## do wp-cli setup
#ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
COPY wp-cli.phar /usr/local/bin/wp
RUN chmod 755 /usr/local/bin/wp
## do plugin installs
WORKDIR /var/www
RUN wp --allow-root --info
WORKDIR /
RUN sed -i -e 's#www-data:/var/www:/usr/sbin/nologin#www-data:/var/www:/bin/sh#' /etc/passwd
RUN /wp-cli-tasks.sh
RUN sed -i -e 's#www-data:/var/www:/bin/sh#www-data:/var/www:/usr/sbin/nologin#' /etc/passwd

# start
CMD ["/bin/bash", "/start.sh"]
