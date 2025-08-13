# Compiler settings
CXX := g++ -std=c++11
CC := gcc

# Compilation and include flags
CFLAGS := -g -DBAGHEERA2 -DLIBSYS_API_EXTENSION -I. -Iinc

# Paths (can be overridden by environment)
ND_CORE_LIB_ROOT ?= /usr/local
PROTOBUF ?= /opt/protobuf

KVS_LIB64_PATH := $(ND_CORE_LIB_ROOT)/nd_thirdparty_lib/lib/kvs_sdk/bagheera2/lib/
OPENSSL_LIB_PATH := $(ND_CORE_LIB_ROOT)/nd_thirdparty_lib/lib/openssl_1.1.1v/bagheera2/lib/
PROTOBUF_PATH := $(PROTOBUF)/bagheera_1_py3.5

# Linker flags
LDFLAGS := -lpthread -lrt \
	-L../ \
	-L/home/ubuntu/bagheera2_essentials/lib_for_device/ \
	-lsys_obd \
	-L$(ND_CORE_LIB_ROOT)/cpp/out/ \
	-lndcore \
	-lsys \
	-L$(ND_CORE_LIB_ROOT)/nd_thirdparty_lib/lib/ \
	-ljansson -liniparser \
	-L$(OPENSSL_LIB_PATH) -lcrypto -lssl \
	-L$(KVS_LIB64_PATH) \
	-L$(PROTOBUF_PATH)/lib \
	-lprotobuf

# Include paths
_INCLUDES := -I$(ND_CORE_LIB_ROOT)/cpp/inc/ndmb \
	-I$(ND_CORE_LIB_ROOT)/cpp/inc/bagheera2 \
	-I$(PROTOBUF_PATH)/inc
