FROM debian:latest


RUN apt-get update -y && apt-get install mariadb-server -y

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

#COPY ./tools/mariadb.sh /
#RUN chmod +x mariadb.sh
RUN mkdir /run/mysqld

CMD ["mysqld"]
