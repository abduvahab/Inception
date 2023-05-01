FROM debian:buster

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y \
		php7.3 \
		php7.3-mysql \
		php7.3-fpm \
		php7.3-gd \
		php7.3-mbstring \
		php7.3-zip \
		mariadb-client \
		wget

RUN mkdir -p /var/www/html
RUN mkdir /run/php

# add user  www-data to process id 82 for contect correctly with nginx 
RUN chown -R www-data:www-data /var/www/html
RUN userdel -f www-data && useradd -u 82 www-data

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/start.sh /start.sh

# download wordpress command line interface and give rights to execute
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp


WORKDIR /var/www/html/wordpress

EXPOSE	9000

ENTRYPOINT ["bash", "/start.sh"]
