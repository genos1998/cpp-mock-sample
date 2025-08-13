# installer_app/Makefile
BASE := $(PWD)/..
include $(BASE)/Makefile.common

SRC := $(wildcard src/*.cpp)
OBJ := $(patsubst src/%.cpp,out/%.o,$(SRC))
EXE := installer_app

OUT_DIR := out
SRC_DIR := src

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(patsubst $(SRC_DIR)/%.cpp,$(OUT_DIR)/%.o,$(SRC))
C_INCLUDES := $(addprefix -1, $(C_INCLUDES))

krait_32: exe
krait_64: exe
bagheera2: exe
bagheera3: exe
x86: exe

exe: checkdirs $(OBJ)
	$(CXX) $(OBJ) $(LDLFLAGS) -o $(OUT_DIR)/$(EXE)

$(OUT_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) -c $< -o $@ -Iinc $(CFLAGS)

checkdirs: $(OUT_DIR)

$(OUT_DIR):
	mkdir -p $@

clean:
	rm -rf $(OUT_DIR)
