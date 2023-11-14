FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN	apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:4096 -days 365 \
		-out /etc/ssl/certs/inception.crt \
		-keyout /etc/ssl/private/inception.key \
		-subj "/C=DE/ST=wob/L=Germany/O=42/OU=42/CN=dnguyen.42.fr/UID=dnguyen"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html



CMD ["nginx", "-g", "daemon off;"]
