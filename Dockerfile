FROM alpine:latest

FROM alpine:edge

RUN apk add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    && rm -rf /var/cache/apk/*

COPY scripts/init.sh /usr/share/bin

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

CMD ["/usr/share/bin/init.sh"]