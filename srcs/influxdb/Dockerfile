FROM    alpine:3.12
RUN     apk update && apk upgrade && \
        apk add influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/ --no-cache
COPY    influxdb.conf /etc/influxdb/influxdb.conf
#RUN     echo "root:root" | chpasswd 2>/dev/null
EXPOSE  8086
ENTRYPOINT  ["/usr/sbin/influxd"]