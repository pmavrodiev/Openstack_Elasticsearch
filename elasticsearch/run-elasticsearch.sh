#!/bin/bash

docker run -it -d -p 9200:9200 -p 9300:9300 -v /root/elasticsearch/data:/root/elasticsearch/data -v /root/elasticsearch/config:/root/elasticsearch/elasticsearch-2.2.0/config -v /root/elasticsearch/logs:/root/elasticsearch/logs elasticsearch_2_2_0 elasticsearch
