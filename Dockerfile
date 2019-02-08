FROM fluent/fluentd:v1.3-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        build-base ruby-dev geoip-dev \
    && gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-geoip \
    && gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

USER fluent
