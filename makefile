CFLAGS =  -Wall -fPIC -static -llibluajit

OS = $(shell uname -s)
ifeq ($(OS), Linux)
	CFLAGS += -D__linux
	CFLAGS_LUA51    = -I/usr/include/lua5.1
	CFLAGS_LUA52    = -DLUA_COMPAT_ALL -I/usr/include/lua5.2
	CFLAGS_LUAJIT20 = -I/usr/include/luajit-2.0
	LIBS_LUAJIT20   = -lluajit-5.1
	EXT = so
else
	CFLAGS += -D__APPLE__
	EXT = dylib
endif

all:
	@echo "make target lists"
	@echo "  lua52            -- build Lua 5.2"
	@echo "  luajit20         -- build Luajit 2.0"
	@echo "  default          -- build Lua 5.2 (V-REP default??)"

default:
	@rm -f lib/*.$(EXT)
	@rm -f *.o
	g++ $(CFLAGS) $(CFLAGS_LUA51) -c v_repLua.cpp -o v_repLua.o
	@mkdir -p lib
	g++ v_repLua.o -o lib/libv_repLua.$(EXT) -lpthread -ldl -shared

lua52:
	g++ $(CFLAGS) $(CFLAGS_LUA52) -c v_repLua.cpp -o v_repLua.o
	@mkdir -p lib
	g++ v_repLua.o -o lib/libv_repLua.$(EXT) -lpthread -ldl -shared

luajit20:
	g++ $(CFLAGS) $(CFLAGS_LUAJIT20) -c v_repLua.cpp -o v_repLua.o
	@mkdir -p lib
	g++ v_repLua.o -o lib/libv_repLua.$(EXT) -lpthread -ldl $(LIBS_LUAJIT20) -shared

clean:
	@rm -f lib/*.$(EXT)
	@rm -f *.o
