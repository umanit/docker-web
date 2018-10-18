build:
	docker build --no-cache -t umanit/web:5.6 -f ./5.6/Dockerfile .
	docker build --no-cache -t umanit/web:7.0 -f ./7.0/Dockerfile .
	docker build --no-cache -t umanit/web:7.1 -f ./7.1/Dockerfile .
	docker build --no-cache -t umanit/web:7.2 -f ./7.2/Dockerfile .

push:
	docker push umanit/web:5.6
	docker push umanit/web:7.0
	docker push umanit/web:7.1
	docker push umanit/web:7.2

all:
	make build
	make push
