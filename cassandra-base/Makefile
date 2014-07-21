#DOCKER_REPOSITORY ?= spotify/squeeze-base
DOCKER_REPOSITORY ?= cassandra/base

DOCKER ?= docker
export DOCKER

DOCKER_INDEX ?= registry:80
DOCKER_FULL_REPOSITORY = $(DOCKER_INDEX)/$(DOCKER_REPOSITORY)
#DOCKER_TAG = $(shell cat ../version.txt)

.PHONY: all image

all: test

image:
	#mkdir -p build
	#sed 's/$${DOCKER_TAG}/$(DOCKER_TAG)/' Dockerfile.in > build/Dockerfile
	#$(DOCKER) build -t $(DOCKER_FULL_REPOSITORY):$(DOCKER_TAG) build
	$(DOCKER) build -t $(DOCKER_REPOSITORY) .

test: image
	#bash -ex runtest $(DOCKER_FULL_REPOSITORY):$(DOCKER_TAG)
	echo "Test not implemented"

#push: test
#	# TODO (dano): there doesn't seem to be a way to push only a single tagged image
#	$(DOCKER) push $(DOCKER_FULL_REPOSITORY)
