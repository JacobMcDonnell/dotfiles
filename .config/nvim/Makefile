FENNEL = fennel
FFLAGS = 
SRCS   = fnl/set.fnl \
         fnl/plugins/knap.fnl \
         fnl/plugins/harpoon.fnl \
         fnl/plugins/treesitter.fnl \
         fnl/plugins/init.fnl \
         fnl/plugins/lsp.fnl \
         fnl/remaps.fnl
LUA    = $(patsubst fnl/%.fnl, lua/%.lua, $(SRCS))

all: $(LUA)

lua/%.lua: fnl/%.fnl
	$(FENNEL) --compile $^ > $@

clean:
	@rm -rf $(LUA)
