FROM postgres:15
ADD ./init.sh /docker-entrypoint-initdb.d/