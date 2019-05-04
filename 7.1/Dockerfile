FROM umanit/php:7.1

ARG USER_ID=1000

RUN apk --no-cache add bash curl git subversion openssh openssl mercurial zlib-dev

# add local user "umanit" with UID 1000 (or any other if USER_ID is override)
RUN adduser -s /bin/bash -u $USER_ID -D -h /home/umanit umanit

# copy custom confs
COPY ./confs/php /usr/local/etc/
COPY ./confs/bashrc /root/.bashrc
COPY ./confs/bashrc /home/umanit/.bashrc
RUN chown umanit:umanit /home/umanit/.bashrc

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 1.7.2
ENV COMPOSER_MEMORY_LIMIT -1

# cannot use the installer due to the bug with openssl: https://github.com/composer/composer/issues/7669
RUN curl -s -f -L -o /usr/bin/composer https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
 && chmod 0755 /usr/bin/composer \
 && composer --ansi --version --no-interaction

# add entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

CMD ["php-fpm"]
