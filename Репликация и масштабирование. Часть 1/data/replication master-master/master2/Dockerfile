FROM mysql:8.4
COPY master2.cnf /etc/mysql/conf.d/master2.cnf
COPY init/ /docker-entrypoint-initdb.d/
RUN chmod 644 /etc/mysql/conf.d/master2.cnf
