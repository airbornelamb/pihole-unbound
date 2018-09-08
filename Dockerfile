FROM alpine:latest

LABEL maintainer="Josh Lamb"

EXPOSE 3535/udp

RUN apk add --no-cache unbound tini curl \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* \
    #&& setcap cap_net_bind_service+ep /usr/sbin/unbound # ALSO do apk add libcap
    && curl -o /etc/unbound/root.hints http://www.internic.net/domain/named.root

COPY unbound.conf /etc/unbound/unbound.conf

RUN unbound-anchor \
    && unbound-checkconf

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/sbin/unbound"]
