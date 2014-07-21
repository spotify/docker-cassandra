#!/usr/bin/env bash

# Disable virtual nodes
sed -i -e "s/num_tokens/\#num_tokens/" $CASSANDRA_CONFIG/cassandra.yaml
