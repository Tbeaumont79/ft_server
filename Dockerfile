FROM debian:buster
MAINTAINER thbeaumo <thbeaumo@student.42.fr>
RUN apt-get update \
    && apt-get install -y  apt-utils wget mariadb-server php-fpm php-mysql nginx
