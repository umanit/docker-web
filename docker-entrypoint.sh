#!/bin/bash

# add host.docker.internal if not exists
HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo -e "$HOST_IP\t$HOST_DOMAIN" >> /etc/hosts
fi

# add local user "umanit"
[[ -z "${LOCAL_USER_ID}" ]] && USER_ID=9001 || USER_ID="${LOCAL_USER_ID}"
adduser -s /bin/bash -u $USER_ID -D -h /home/umanit umanit

exec "$@"
