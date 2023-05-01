FROM debian:buster


RUN apt-get update -y && apt-get install -y mariadb-server 


COPY ./conf/mysql.cnf /etc/mysql/mariadb.conf.d/


COPY ./tools/start.sh /

EXPOSE 3306

CMD ["bash","/start.sh"]