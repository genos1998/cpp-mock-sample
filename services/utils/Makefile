CXX := g++ -std=c++11
CC := gcc

CFLAGS := -g -DBAGHEERA2 -DLIBSYS_API_EXTENSION -I. -Iinc

ND_CORE_LIB_ROOT ?= /usr/local

KVS_LIB64_PATH := $(ND_CORE_LIB_ROOT)/nd_thirdparty_lib/lib/kvs_sdk/bagheera2/lib/
OPENSSL_LIB_PATH := $(ND_CORE_LIB_ROOT)/nd_thirdparty_lib/lib/openssl_1.1.1v/bagheera2/lib/
PROTOBUF_PATH := $(PROTOBUF)/bagheera_1_py3.5

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

_INCLUDES := -I$(ND_CORE_LIB_ROOT)/cpp/inc/ndmb \
	-I$(ND_CORE_LIB_ROOT)/cpp/inc/bagheera2 \
	-I$(PROTOBUF_PATH)/inc

SRC := $(wildcard src/*.cpp)
OBJ := $(patsubst src/%.cpp, out/%.o, $(SRC))
BIN := utils

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
	@echo "  LINK -> $@"
	$(CXX) -std=c++11 $(OBJ) $(LDFLAGS) -o $@

out/%.o: src/%.cpp
	@mkdir -p out
	@echo "  CC -> $@"
	$(CXX) $(CFLAGS) $(_INCLUDES) -c $< -o $@

clean:
	@rm -rf out $(BIN)
