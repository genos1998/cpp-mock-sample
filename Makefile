BASE = $(PWD)
include $(BASE)/Makefile.common

awsiot_dir:= awsiot
apm_dir := apm
bagheera2: bagheera_dir := nd-central/device/bagheera2
bagheera3: bagheera_dir := nd-central/device/bagheera2
krait_32 : bagheera_dir := nd-central/device/krait
x86: bagheera_dir := nd-central/device/bagheera2
nd_bt_dir := nd_bt
cam_rec_dir := nd-cam_recorder
circular_buffer_dir := circular_buffer
diagnostic_dir := diagnostic
ext_cam_dir := ext_cam
installer_app_dir := installer_app
nd_sam_dir := nd_sam
nd_shutdown_dir := nd_shutdown
nd_suspendresume_dir := nd_suspendresume
scheduler_manager_dir := scheduler_manager
obd_dir := obd/service
obd_fw_dir := obd/fw_update
onetime_service_dir := onetime_service
power_monitor_dir := power_monitor
run_as_root_dir := run_as_root
speed_dir := speed
svc_dir := svc
service_mon_dir := service_mon
time_sync_dir := time_sync
uploader_dir := uploader
update_recovery_dir := update_recovery
wifi_mgr_dir := wifi_mgr
fan_control_dir := fan_control
nd_app_reboot_dir := nd_app_reboot
nd_dta_dir := nd_dta
gps_dir := gps
krait_32 : conn_mgr_dir := misc/lte/Connection_Manager/bin/arm
krait_64 : conn_mgr_dir := misc/lte/Connection_Manager/bin/arm64

ifeq "$(MAKECMDGOALS)" "bagheera2"
build_services := apm awsiot bagheera cam_rec circular_buffer uploader scheduler_manager ext_cam obd wifi_mgr installer_app 
else ifeq "$(MAKECMDGOALS)" "bagheera3"
build_services := awsiot apm bagheera cam_rec circular_buffer uploader scheduler_manager ext_cam wifi_mgr installer_app nd_bt
else ifeq "$(MAKECMDGOALS)" "x86"
build_services := awsiot bagheera circular_buffer uploader scheduler_manager ext_cam wifi_mgr installer_app speed svc service_mon 
else 
build_services := awsiot bagheera circular_buffer uploader scheduler_manager ext_cam wifi_mgr installer_app speed svc service_mon gps
endif

.PHONY: all
all: export_base $(build_services)

krait_32 : all
krait_64 : all
bagheera2: all
bagheera3: all
bagheera: all
x86: all

export_base:
	$(eval export BASE=$(BASE))

.PHONY: $(build_services)
$(build_services):
	@echo "============"
	@echo Building $@
	@echo "============"
	if [$@="nd_bt"];then \
		rm -rf $($@_dir)/build && mkdir $($@_dir)/build && cd $($@_dir)/build; \
		if [ $(MAKECMDGOALS) = "bagheera"]; then \
			cmake .. -DFOR_TARGET=BAGHEERA && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "bagheera2"]; then \
			cmake .. -DFOR_TARGET=BAGHEERA2 && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "bagheera3"]; then \
			cmake .. -DFOR_TARGET=BAGHEERA2 && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "krait_32"] || [ $(MAKECMDGOALS) = "krait_64"]; then \
			cmake .. -DFOR_TARGET=KRAIT -DCMAKE_TOOLCHAIN_FILE=../krait64_toolchain.cmake && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "x86"]; then \
			cmake .. -DFOR_TARGET=x86 && $(MAKE); \
		fi; \
	elif [$@="nd_sam"]; then \
		rm -rf $($@_dir)/build && mkdir $($@_dir)/build && cd $($@_dir)/build; \
		if [ $(MAKECMDGOALS) = "bagheera"]; then \
			cmake .. -DFOR_TARGET=BAGHEERA && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "bagheera2"]; then \
			cmake .. -DFOR_TARGET=BAGHEERA2 && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "bagheera3"]; then \
			cmake .. -DFOR_TARGET=BAGHEERA2 && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "krait_32"]; then \
			cmake .. -DFOR_TARGET=KRAIT -DCMAKE_TOOLCHAIN_FILE=../krait32_toolchain.cmake && $(MAKE); \
		elif [ $(MAKECMDGOALS) = "x86"]; then \
			cmake .. -DFOR_TARGET=x86 && $(MAKE); \
		fi; \
	elif [ $@ = "installer_app"]; then \
	cd $($@_dir)/$(PRODUCT); $(MAKE) $(MAKECMDGOALS); \
	elif [ $@ = "run_as_root"] && [ $(MAKECMDGOALS) = "krait_32"]; then \
	cd $($@_dir)/krait; $(MAKE) $(MAKECMDGOALS); \
	elif [ $@ = "run_as_root"] && [ $(MAKECMDGOALS) = "bagheera2"]; then \
	cd $($@_dir)/$(PRODUCT); $(MAKE) $(MAKECMDGOALS); \
	elif [ $@ = "run_as_root"] && [ $(MAKECMDGOALS) = "bagheera3"]; then \
	cd $($@_dir)/$(PRODUCT); $(MAKE) $(MAKECMDGOALS); \
	else \
	cd $($@_dir); $(MAKE) $(MAKECMDGOALS); \
	fi;
	mkdir -p build/service/$@ ; \




