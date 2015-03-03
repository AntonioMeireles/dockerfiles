#!/bin/sh

main() {
    local ELASTICSEARCH_YML="/elasticsearch/config/elasticsearch.yml"
    exec /elasticsearch/bin/elasticsearch -Des.config=${ELASTICSEARCH_YML} "$@"
}

main "$@"