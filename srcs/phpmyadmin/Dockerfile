FROM    alpine:3.12
RUN     apk update && apk upgrade && \
        apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
        php7-zlib php7-curl php7-mbstring php7-json php7-session wget tar --no-cache \
        && wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz \
        && tar -xvf /phpMyAdmin-4.9.5-all-languages.tar.gz \
        && rm -f /phpMyAdmin-4.9.5-all-languages.tar.gz \
        && mv /phpMyAdmin-4.9.5-all-languages /etc/phpmyadmin
COPY    config.inc.php etc/phpmyadmin/config.inc.php

EXPOSE 5000
CMD php -S 0.0.0.0:5000 -t /etc/phpmyadmin/