BASE ?= $(realpath ../..)
include $(BASE)/Makefile.common

EXE     := example
INC_DIR := inc
SRC_DIR := src
OUT_DIR := out

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(patsubst $(SRC_DIR)/%.cpp, $(OUT_DIR)/%.o, $(SRC))

.PHONY: all exe krait_32 krait_64 bagheera2 bagheera3 x86 clean

all: exe

# Compile rule: src/foo.cpp -> out/foo.o
$(OUT_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OUT_DIR)
	@echo "  CC -> $@"
	$(CXX) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

# Link objects into the final binary
exe: $(OBJ)
	@echo "  LINK -> $(EXE)"
	$(CXX) $(OBJ) $(LDFLAGS) -o $(EXE)

# Flavor targets (all just build the same exe here)
krait_32: exe
krait_64: exe
bagheera2: exe
bagheera3: exe
x86: exe

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

clean:
	@echo "  Cleaning example"
	rm -rf $(OUT_DIR) $(EXE)
