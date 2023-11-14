FROM debian:bullseye

ARG SITE_TITLE
ARG A_USER
ARG A_PWD
ARG A_EMAIL

ARG USER1_LOGIN
ARG USER1_PASS
ARG USER1_MAIL

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4\
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

COPY	conf/script.sh /tmp/script.sh
RUN		chmod +x /tmp/script.sh
COPY	./conf/php.conf	/etc/php/7.4/fpm/pool.d/www.conf
RUN		chmod +x /etc/php/7.4/fpm/pool.d/www.conf


ENTRYPOINT ["bash", "/tmp/script.sh"]