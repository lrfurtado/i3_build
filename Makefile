build: ## build i3
	docker build -t extract .
	docker create --name tmp extract:latest 
	docker cp tmp:/root/rpmbuild/RPMS/x86_64/i3-1-1.x86_64.rpm .
	docker rm tmp

clean: ## Remove generated files
	-rm -v *.rpm
MAKEFILE_LIST:=Makefile
.PHONY: help
help: ## help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort |  awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
