# Spotify Cassandra 2.0 Base Image
#
# VERSION               0.1
#
# Installs Cassandra 2.0 package. Does only basic configuration.
# Tokens and seed nodes should be configured by child images.

FROM java:7

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Workaround for https://github.com/docker/docker/issues/6345
RUN ln -s -f /bin/true /usr/bin/chfn

# Install Cassandra 2.1.2
RUN apt-get -y --force-yes install python-pip && \
       wget -O python-support_1.0.15_all.deb http://launchpadlibrarian.net/109052632/python-support_1.0.15_all.deb && \
       wget -O cassandra_2.1.2_all.deb http://debian.datastax.com/community/pool/cassandra_2.1.2_all.deb && \
       wget -O dsc21_2.1.2-1_all.deb http://debian.datastax.com/community/pool/dsc21_2.1.2-1_all.deb && \
       dpkg -i python-support_1.0.15_all.deb && \
       dpkg -i cassandra_2.1.2_all.deb && \
       dpkg -i dsc21_2.1.2-1_all.deb && \
       rm -rf python-support_1.0.15_all.deb python-support_1.0.15_all.deb dsc21_2.1.2-1_all.deb

ENV CASSANDRA_CONFIG /etc/cassandra

# Run base config script
ADD scripts/config-cassandra-base.sh /usr/local/bin/config-cassandra-base
RUN /usr/local/bin/config-cassandra-base

# Necessary since cassandra is trying to override the system limitations
# See https://groups.google.com/forum/#!msg/docker-dev/8TM_jLGpRKU/dewIQhcs7oAJ
RUN rm -f /etc/security/limits.d/cassandra.conf

EXPOSE 7199 7000 7001 9160 9042 22 8012 61621

RUN apt-get update

CMD [""]
