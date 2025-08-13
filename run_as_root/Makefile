# run_as_root/Makefile
BASE := $(PWD)/..
include $(BASE)/Makefile.common

SRC := $(wildcard src/*.cpp)
OBJ := $(patsubst src/%.cpp,out/%.o,$(SRC))
BIN := run_as_root

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
	@echo "  LINK -> $@"
	$(CXX) $(OBJ) $(LDFLAGS) -o $@

out/%.o: src/%.cpp
	@mkdir -p out
	@echo "  CC -> $@"
	$(CXX) $(CFLAGS) -c $< -o $@

clean:
	@rm -rf out $(BIN)
