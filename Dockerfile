FROM alpine:latest

COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY scripts/docker-healthcheck.sh /usr/local/bin/docker-healthcheck.sh

RUN apk add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    && rm -rf /var/cache/apk/* \
    && chmod 755 /usr/local/bin/*.sh

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

CMD ["/usr/local/bin/docker-entrypoint.sh"]