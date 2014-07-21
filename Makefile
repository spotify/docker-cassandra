DOCKER ?= docker
export DOCKER

HELIOS ?= helios -z http://localhost:5801

ALL_SUBDIRS= cassandra-base cassandra-clusternode cassandra-singlenode

.PHONY: verify-search-domain clean all image base single cluster test

all: test

verify-search-domain:
	./verify-search-domain.sh

image: base single cluster

base: verify-search-domain
	make -C cassandra-base image

single: verify-search-domain
	make -C cassandra-singlenode image

cluster: verify-search-domain
	make -C cassandra-clusternode image

test:
	## broken out this way so the build fails on first test failure
	make -C cassandra-base $@
	make -C cassandra-singlenode $@
	make -C cassandra-clusternode $@

##push: test
##	for i in $(ALL_SUBDIRS); do make -C $$i $@; done

clean: clean_docker
	docker images | grep cassandra | tr -s ' '  | cut -d' ' -f3 | xargs docker rmi

clean_docker:
	docker ps -a -q | cut -d' ' -f1 | xargs -r docker rm

clean_helios:
	for I in `$(HELIOS) jobs -q`; do $(HELIOS) undeploy --all $$I; $(HELIOS) remove $$I; done
