FROM alpine:3.7@sha256:8c03bb07a531c53ad7d0f6e7041b64d81f99c6e493cb39abba56d956b40eacbc

LABEL maintainer="khs1994-docker/lnmp <khs1994@khs1994.com>"

ENV ACME_SH_VERSION=2.7.8 \
    AUTO_UPGRADE=1 \
    LE_CONFIG_HOME=/acme.sh

RUN apk add --no-cache openssl \
                       curl \
                       socat \
    && curl https://raw.githubusercontent.com/Neilpang/acme.sh/${ACME_SH_VERSION}/acme.sh | INSTALLONLINE=1  sh \
    && ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /acme.sh /ssl

ENTRYPOINT ["/docker-entrypoint.sh"]
