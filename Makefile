TAGS=5.6 7.0 7.1 7.2 7.3

define build_image
	docker build --no-cache -t umanit/web:$(1) -f ./$(1)/Dockerfile .
endef

define push_image
	docker push umanit/web:$(1)
endef

build:
ifndef tag
	for available_tag in $(TAGS) ; do \
		$(call build_image,$$available_tag) ; \
	done
else
	$(call build_image,$(tag))
endif

push:
ifndef tag
	for available_tag in $(TAGS) ; do \
		$(call push_image,$$available_tag) ; \
	done
else
	$(call push_image,$(tag))
endif

all:
	make build
	make push
