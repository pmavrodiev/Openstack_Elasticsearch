#!/bin/bash

set -e

if [ "$1" = 'bash' ]; then
    chown -R elasticsearch /home/elasticsearch/data
    chgrp -R elasticsearch /home/elasticsearch/data
	exec gosu elasticsearch "$@"
fi

# allow the container to be started with `--user`
# if [ "$1" = 'elasticsearch' -a $(id -u > /dev/null 2>&1; echo $?) ]; then
	# chown -R elasticsearch:elasticsearch /usr/share/elasticsearch
#	echo "$BASH_SOURCE"
#	exec gosu elasticsearch "$BASH_SOURCE" "$@"
#fi

exec "$@"

# Add elasticsearch as command if needed
# if [ "${1:0:1}" = '-' ]; then
# 	set -- elasticsearch "$@"
# fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
# if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
#	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

#	set -- gosu elasticsearch "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
# fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
