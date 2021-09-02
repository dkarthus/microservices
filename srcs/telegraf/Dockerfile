FROM    alpine:3.12
RUN     apk update && apk upgrade && \
        apk add --no-cache --repository \
        http://dl-3.alpinelinux.org/alpine/edge/community telegraf && \
        mkdir -p /etc/telegraf
COPY    telegraf.conf etc/telegraf/telegraf.conf
CMD     ["telegraf"]