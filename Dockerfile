FROM fluent/fluentd:v1.3-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
    && apk add --no-cache \
        geoip geoip-dev libmaxminddb automake autoconf libtool libc6-compat \
    && gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-geoip \
        fluent-plugin-kubernetes_metadata_filter \
    && gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem \

USER fluent
