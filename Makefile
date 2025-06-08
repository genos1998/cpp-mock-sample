BASE ?= $(PWD)
include $(BASE)/Makefile.common

utils_dir  := services/utils
awsiot_dir := services/awsiot

.PHONY: all utils awsiot clean

all: utils awsiot

utils:
	@echo "Building service: utils"
	$(MAKE) -C $(utils_dir)

awsiot:
	@echo "Building service: awsiot"
	$(MAKE) -C $(awsiot_dir)

clean:
	@$(MAKE) -C $(utils_dir) clean
	@$(MAKE) -C $(awsiot_dir) clean
