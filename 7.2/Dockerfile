FROM umanit/php:7.2

RUN apk --no-cache add curl git subversion openssh openssl mercurial zlib-dev

RUN echo "memory_limit = -1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
    && echo "date.timezone = Europe/Paris" > "$PHP_INI_DIR/conf.d/date_timezone.ini" \
    && echo -e "upload_max_filesize = 200M\npost_max_size = 500M" > "$PHP_INI_DIR/conf.d/max-sizes.ini"

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 1.6.4

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

CMD ["php-fpm"]