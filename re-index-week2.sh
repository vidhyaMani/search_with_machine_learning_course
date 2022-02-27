#!/bin/sh
reindex_init () {
    echo "Killing previous logstash running instance"
    kill -9 $(pgrep -f 'logstash')

    echo "Removing logstash data files ..."
    rm /workspace/logstash/logstash-7.13.2/products_data/plugins/inputs/file/.sincedb_*

    echo "Removing indices ..."
    sh delete-indexes.sh

    echo "Indexing data ..."
    sh ./index-data.sh -p /workspace/search_with_machine_learning_course/week2/conf/bbuy_products.json -q /workspace/search_with_machine_learning_course/week2/conf/bbuy_queries.json
}

reindex_init