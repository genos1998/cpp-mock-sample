include Makefile.common
build_services := service1 service2

service1_dir := services/service1
service2_dir := services/service2

.PHONY: all
all: export_base $(build_services)

export_base:
	$(eval export BASE=$(BASE))

.PHONY: $(build_services)
$(build_services):
	@echo "==> Entering $($@_dir) to run '$(MAKECMDGOALS)'"
	@cd $($@_dir) && $(MAKE) $(MAKECMDGOALS)

.PHONY: clean
clean:
	@for svc in $(build_services); do \
		echo "==> Cleaning $$svc"; \
		cd $${svc}_dir && $(MAKE) clean; \
	done
