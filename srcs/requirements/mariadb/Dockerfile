FROM debian:bullseye

ARG DB_DATABASE
ARG DB_USER_NAME
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init
RUN apt-get install -y mariadb-server
RUN apt-get clean -y

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN service mariadb start \
	&& mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
	GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
	FLUSH PRIVILEGES;"

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
#listening to all ports
CMD ["mysqld", "--bind-address=0.0.0.0" ]