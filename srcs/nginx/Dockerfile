FROM    alpine:3.12
RUN     apk update && apk upgrade && apk add --no-cache nginx openssl

RUN     adduser -D -g 'www' www && mkdir -p /run/nginx
COPY    nginx.conf /etc/nginx/nginx.conf
COPY    index.html /var/www/localhost/htdocs/index.html
RUN     openssl req -newkey rsa:2048 -x509 -sha256 -days 3650 -nodes \
                -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=dkarthus/CN=localhost" \
                -keyout /etc/ssl/private/ft_services.key -out /etc/ssl/certs/ft_services.crt
RUN     chown -R www:www /etc/nginx/nginx.conf /etc/ssl /run/nginx /var/www/localhost/htdocs/index.html
EXPOSE  80 443
ENTRYPOINT  ["nginx", "-g", "daemon off;"]