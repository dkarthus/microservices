FROM    alpine:3.12

RUN     apk update && apk upgrade && apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli \
        tar php7-zlib php7-curl php7-mbstring php7-json php7-session --no-cache && \
        wget https://wordpress.org/latest.tar.gz && tar -xf latest.tar.gz && rm -f latest.tar.gz && \
        mv wordpress /etc/

COPY    wp-config.php /etc/wordpress/

EXPOSE  5050

CMD     php -S 0.0.0.0:5050 -t /etc/wordpress/