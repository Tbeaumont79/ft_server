FROM debian:buster
MAINTAINER thbeaumo <thbeaumo@student.42.fr>
RUN apt-get update \
    && apt-get install -y  apt-utils wget mariadb-server php-fpm php-mysql nginx sudo curl
CMD /etc/init.d/mysql start
CMD ["mysql -u root-p=\""root"\""]
CMD ["CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"]

CMD ["GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'enter-password-here';"]

CMD ["FLUSH PRIVILEGES;"]

CMD ["EXIT;"]



RUN wget https://wordpress.org/latest.tar.gz

RUN tar xzvf latest.tar.gz

