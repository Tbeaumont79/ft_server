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
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=192.168.99.102" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./srcs/script.sh script.sh
COPY ./srcs/localhost /etc/nginx/sites-available/default
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./srcs/handledatabase .

EXPOSE 80
EXPOSE 443

CMD ["bash", "script.sh"]
