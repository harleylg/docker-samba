FROM alpine:latest

COPY scripts/init.sh /usr/local/bin/init.sh

RUN apk add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    && rm -rf /var/cache/apk/* \
    && chmod 755 /usr/local/bin/init.sh

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

CMD ["/usr/local/bin/init.sh"]