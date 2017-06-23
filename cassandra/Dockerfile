# Spotify Cassandra 2.0 Single Node Image
#
# VERSION               0.1
#
# Starts a Cassandra instance constituting a one node cluster. 

FROM peerbelt/cassandra:base-armhf-2.1.2

USER root

# Add extensible healthcheck
ADD scripts/cassandra-healthcheck.sh /usr/local/bin/cassandra-healthcheck
HEALTHCHECK --interval=60s --timeout=15s --retries=5 CMD [ "cassandra-healthcheck" ]

# Place single-node startup-config script
ADD scripts/cassandra-singlenode.sh /usr/local/bin/cassandra-singlenode

# Start Cassandra
ENTRYPOINT ["cassandra-singlenode"]

