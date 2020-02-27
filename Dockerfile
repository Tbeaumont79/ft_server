FROM debian:buster
MAINTAINER thbeaumo <thbeaumo@student.42.fr>
RUN apt-get update \
    && apt-get install -y apt-utils wget mariadb-server php-fpm php-mysql nginx sudo curl
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN mv wordpress /var/www/html
RUN	chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress
RUN rm latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default


COPY ./srcs/script.sh script.sh
COPY ./srcs/localhost /etc/nginx/sites-available/default
COPY ./srcs/wordpress /etc/nginx/sites-available/
COPY ./srcs/phpMyAdmin /etc/nginx/sites-available/
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./srcs/handledatabase handledatabase
COPY ./srcs/index.php /var/www/html/index.php
CMD ["bash", "script.sh"]
