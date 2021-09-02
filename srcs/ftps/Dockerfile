FROM    alpine:3.12
RUN     apk update && apk upgrade && apk add --no-cache openssl vsftpd
RUN     echo "root:root" | chpasswd 2>/dev/null
RUN     openssl req -newkey rsa:2048 -x509 -sha256 -days 3650 -nodes \
        -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=dkarthus/CN=localhost" \
        -keyout /etc/ssl/private/ft_services.key -out /etc/ssl/certs/ft_services.crt
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY    entrypoint.sh /usr/sbin/
RUN     chmod +x /usr/sbin/entrypoint.sh
EXPOSE  21 20 30001 30002

CMD     ["/usr/sbin/entrypoint.sh"]