.PHONY: help
help:	## show makefile help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build:	## build image
	docker build . --no-cache --pull -t nextmetaphor/dockerized-alpine-angular

run: ## run image
	docker run -v $(PWD)/src:/var/opt/angular -p 4200:4200 -w /var/opt/angular -it nextmetaphor/dockerized-alpine-angular sh