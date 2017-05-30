FROM alpine:edge

LABEL maintainer="Sebastian Sasu <sebi@nologin.ro>" description="Unbound DNS cache"

RUN apk add --update unbound tini && rm -rf /var/cache/apk/*
COPY unbound.conf /etc/unbound/unbound.conf
RUN unbound-anchor
RUN unbound-checkconf
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["unbound"]
