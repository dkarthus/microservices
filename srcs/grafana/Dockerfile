FROM    alpine:3.12
RUN     apk update && apk upgrade && \
        apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        --no-cache
COPY    grafana.ini /etc/grafana/grafana.ini
COPY    dashboards /var/lib/grafana/dashboards/
COPY    influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY    dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
EXPOSE  3000

ENTRYPOINT ["/usr/sbin/grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana"]