#!/bin/bash

set -e

if [ "$1" = 'elasticsearch' ]; then
    exec /root/elasticsearch/elasticsearch-2.2.0/bin/elasticsearch -Des.insecure.allow.root=true
fi

exec "$@"
