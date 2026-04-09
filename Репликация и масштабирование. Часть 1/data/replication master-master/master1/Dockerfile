FROM mysql:8.4
COPY master1.cnf /etc/mysql/conf.d/master1.cnf
COPY init/ /docker-entrypoint-initdb.d/
RUN chmod 644 /etc/mysql/conf.d/master1.cnf
