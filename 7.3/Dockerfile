ARG ENABLE_XDEBUG

FROM umanit/php:7.3

RUN apk --no-cache add bash curl git subversion openssh openssl mercurial zlib-dev \
    && mkdir -p /var/log/php

# copy custom confs
COPY ./confs/php /usr/local/etc/
COPY ./confs/bashrc /root/.bashrc
COPY ./confs/bashrc /home/www-data/.bashrc
RUN chown www-data:www-data /home/www-data/.bashrc

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 1.8.5

RUN curl --silent --fail --location --retry 3 --output /tmp/installer.php --url https://raw.githubusercontent.com/composer/getcomposer.org/cb19f2aa3aeaa2006c0cd69a7ef011eb31463067/web/installer \
 && php -r " \
    \$signature = '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5'; \
    \$hash = hash('sha384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
      unlink('/tmp/installer.php'); \
      echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
      exit(1); \
    }" \
 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
 && composer --ansi --version --no-interaction \
 && rm -f /tmp/installer.php

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/php/fpm-access.log \
	&& ln -sf /dev/stderr /var/log/php/fpm-error.log

# add entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

CMD ["php-fpm"]
