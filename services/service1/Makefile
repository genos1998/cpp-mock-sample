BASE = $(PWD)/../..
include $(BASE)/Makefile

SRC := $(wildcard src/*.cpp)
OBJ := $(patsubst src/%.cpp, out/%.o, $(SRC))
BIN := service1

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
	@echo "  LINK -> $@"
	$(CXX) $(OBJ) $(LDFLAGS) -o $@

out/%.o: src/%.cpp
	@mkdir -p out
	@echo "  CC -> $@"
	$(CXX) $(CFLAGS) $(_INCLUDES) -c $< -o $@

clean:
	@rm -rf out $(BIN)
