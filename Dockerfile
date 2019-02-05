FROM fluent/fluentd:v1.3-onbuild-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
    sudo build-base ruby-dev \
        && sudo gem install \
            fluent-plugin-elasticsearch \
        && sudo gem sources --clear-all \
        && apk del .build-deps \
        && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

USER fluent