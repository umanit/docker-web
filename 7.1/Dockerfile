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

RUN curl -s -f -L -o /tmp/installer.php https://raw.githubusercontent.com/composer/getcomposer.org/b107d959a5924af895807021fcef4ffec5a76aa9/web/installer \
 && php -r " \
    \$signature = '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061'; \
    \$hash = hash('SHA384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
        unlink('/tmp/installer.php'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    }" \
 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
 && composer --ansi --version --no-interaction \
 && rm -rf /tmp/* /tmp/.htaccess

# add entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

CMD ["php-fpm"]
