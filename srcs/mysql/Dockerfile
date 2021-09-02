FROM    alpine:3.12
COPY    my.cnf wordpress.sql db-init setup.sh ./
RUN     apk update && apk upgrade && apk add mysql mysql-client mariadb-client --no-cache \
        && mkdir -p /run/mysqld \
        && mv my.cnf /etc/mysql/my.cnf && chmod +x ./setup.sh \
        && mysql --version

EXPOSE  3306
ENTRYPOINT  ./setup.sh
