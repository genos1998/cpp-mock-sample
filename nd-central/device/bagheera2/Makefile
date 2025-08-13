BASE = $(PWD)/../../..
NDcentral_BASE=$(PWD)

include $(BASE)/Makefile.common
include $(NDcentral_BASE)/Makefile.ndcentralcommon

TRGTS = folder IO common #dev_utils
EXEC_NAME= bagheera
OBJ_LIST=$(wildcard $(OUT)/*.o)
OBJ_LIST+=$(ND_PROTO)/audio.pb.a

all: $(TRGTS)
	 echo "================="
	 echo "Building ndcentral witht this libraries & linking flags" - $(LDLFLAGS)
	 echo "================="
	 $(CXX) $(OBJ_LIST) $(LDLFLAGS) -o $(OUT)/$(EXEC_NAME)

krait_32: all

krait_64: all

x86: all

bagheera2: all

folder:
	mkdir -p ./out

IO: .PHONY
	cd io; make BASE=$(BASE) NDcentral_BASE=$(NDcentral_BASE) $(MAKECMDGOALS)

common: .PHONY
	cd ../../common; make BASE=$(BASE) NDcentral_BASE=$(NDcentral_BASE) $(MAKECMDGOALS)

clean:
	rm -rf ./out
	rm -rf $(BASE)/nd_proto/audio.pb.* 

.PHONY: