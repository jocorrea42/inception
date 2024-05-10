FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/.
EXPOSE 3306
COPY ./tools/mariadb.sh /
RUN chmod +x mariadb.sh
#RUN mkdir ../../mariadb
CMD ["./mariadb.sh"]