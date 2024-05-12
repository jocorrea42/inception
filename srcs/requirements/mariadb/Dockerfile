FROM debian:latest


RUN apt-get update -y && apt-get install mariadb-server -y

#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


#COPY ./tools/mariadb.sh /
#RUN chmod +x mariadb.sh
#RUN mkdir /run/mysqld

CMD ["mysqld_safe"]
