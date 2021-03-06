FROM java:8-jre

RUN apt-get update && apt-get install -y --no-install-recommends \
		wget \
	&& rm -rf /var/lib/apt/lists/*


RUN set -x \
    && apt-get update \
    && apt-get install net-tools \
    && apt-get install sudo

# grab gosu for easy step-down from root
# ENV GOSU_VERSION 1.7
#RUN set -x \
#	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
#	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
#	&& export GNUPGHOME="$(mktemp -d)" \
#	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
#	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
#	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
#	&& chmod +x /usr/local/bin/gosu \
#	&& gosu elasticsearch true

ENV ELASTICSEARCH_VERSION "2.2.0"
ENV ELASTICSEARCH_URL "https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.2.0/elasticsearch-2.2.0.tar.gz"

RUN set -x \
    && mkdir -p /root/elasticsearch \
    && wget -O /root/elasticsearch/elastic.tar.gz "$ELASTICSEARCH_URL" \
    && tar xvfz /root/elasticsearch/elastic.tar.gz -C /root/elasticsearch/ \
    && rm /root/elasticsearch/elastic.tar.gz

# create the volumes
RUN set -ex \
	&& for path in \
		/root/elasticsearch/data \
		/root/elasticsearch/config \
		/root/elasticsearch/logs \
	; do \
		mkdir -p "$path"; \
	done

VOLUME ["/home/elasticsearch/data"]

WORKDIR /root/elasticsearch/

COPY docker-entrypoint.sh /root/elasticsearch/docker-entrypoint.sh

RUN chmod +x /root/elasticsearch/docker-entrypoint.sh
#RUN chown -R elasticsearch /home/elasticsearch
#RUN chgrp -R elasticsearch /home/elasticsearch

ENTRYPOINT ["/root/elasticsearch/docker-entrypoint.sh"]

EXPOSE 9200 9300
CMD ["elasticsearch"]