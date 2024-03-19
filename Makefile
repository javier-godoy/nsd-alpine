ALPINE_TAG=3.19.1
NSD_TAG=NSD_4_8_0_REL

TAG = jgodoy/nsd\:$(NSD_TAG)-alpine-$(ALPINE_TAG)

.PHONY: build

build:
	docker build . -t $(TAG) \
		--build-arg ALPINE_TAG=$(ALPINE_TAG) \
		--build-arg NSD_TAG=$(NSD_TAG)

install: build
