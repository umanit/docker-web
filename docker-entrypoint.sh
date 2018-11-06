#!/bin/sh
set -e

# disable xdebug if not required
if [ -z "$ENABLE_XDEBUG" ]; then
  sed -i -e 's/^/;/' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

exec "$@"
