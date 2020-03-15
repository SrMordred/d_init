COMPILER = ldc2
SRC      = src
BIN      = bin

MAIN  = $(SRC)/main.d
OUT   = $(BIN)/main.exe

FLAGS += --betterC
FLAGS += -m64
FLAGS += -O0


WEB_FLAGS += --output-bc
WEB_FLAGS += -mtriple=wasm32-unknown-unknown-webassembly
WEB_OUT = -of=web/main.bc

WEB_FNS += -s EXPORTED_FUNCTIONS='["_add"]' 
WEB_FNS += -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

all:
	$(COMPILER) $(MAIN) $(FLAGS) -of=$(OUT)
	$(OUT)

web:
	$(CC) $(MAIN) $(FLAGS) $(WEB_FLAGS) $(WEB_OUT)
	emcc web/main.bc -s WASM=1 $(WEB_FNS) -o web/index.js --js-library web/libs.js



