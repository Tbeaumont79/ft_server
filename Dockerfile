FROM debian:buster
MAINTAINER thbeaumo <thbeaumo@student.42.fr>
RUN apt-get update \
    && apt-get install -y apt-utils wget mariadb-server php-fpm php-mysql nginx sudo curl
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN mkdir /var/www/localhost/
RUN mv wordpress /var/www/localhost/wordpress
RUN	chown -R www-data:www-data /var/www/localhost/
RUN chmod -R 755 /var/www/localhost/wordpress/
RUN rm latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/localhost/phpMyAdmin
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
COPY ./srcs/script.sh script.sh
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/wp-config.php /var/www/localhost/wordpress/wp-config.php
COPY ./srcs/handledatabase handledatabase
COPY ./srcs/index.php /var/www/localhost/index.php
CMD ["bash", "script.sh"]
