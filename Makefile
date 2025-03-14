CUR_DIR := .
SRC_DIR := $(CUR_DIR)/src
INC_DIR := $(CUR_DIR)/inc
OBJ_DIR := $(CUR_DIR)/obj
BIN_DIR := $(CUR_DIR)/bin
LIB_DIR := $(CUR_DIR)/lib
LIB_STATIC_DIR := $(LIB_DIR)/static
LIB_SHARED_DIR := $(LIB_DIR)/shared
C_FLAGS := -I $(INC_DIR)


# Build object files
$(OBJ_DIR)/cat.o: $(SRC_DIR)/cat.c | $(OBJ_DIR)
	gcc -c -fPIC $< -o $@ $(C_FLAGS)

$(OBJ_DIR)/dog.o: $(SRC_DIR)/dog.c | $(OBJ_DIR)
	gcc -c -fPIC $< -o $@ $(C_FLAGS)

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c | $(OBJ_DIR)
	gcc -c -fPIC $< -o $@ $(C_FLAGS)  

# Build static library
$(LIB_STATIC_DIR)/libspet.a: $(OBJ_DIR)/cat.o $(OBJ_DIR)/dog.o | $(LIB_STATIC_DIR)
	ar rcs $@ $^

# Build shared library
$(LIB_SHARED_DIR)/libdpet.so: $(OBJ_DIR)/cat.o $(OBJ_DIR)/dog.o | $(LIB_SHARED_DIR)
	gcc -shared $^ -o $@

# Group rules
create_objs: $(OBJ_DIR)/cat.o $(OBJ_DIR)/dog.o $(OBJ_DIR)/main.o
create_static_lib: $(LIB_STATIC_DIR)/libspet.a
create_shared_lib: $(LIB_SHARED_DIR)/libdpet.so

all_shared: create_objs create_shared_lib
	gcc $(OBJ_DIR)/main.o -L$(LIB_SHARED_DIR) -ldpet -o $(BIN_DIR)/use-shared-lib

all_static: create_objs create_static_lib
	gcc $(OBJ_DIR)/main.o -L$(LIB_STATIC_DIR) -lspet -o $(BIN_DIR)/use-static-lib

clean:
	rm -rf $(OBJ_DIR) $(LIB_DIR) $(BIN_DIR)
