local lsp = require('lsp-zero')

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-n>'] = cmp_action.luasnip_jump_forward(),
		['<C-p>'] = cmp_action.luasnip_jump_backward(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})

require('lspconfig').clangd.setup({
	on_new_config = function(new_config, new_cwd)
		local status, cmake = pcall(require, "cmake-tools")
		if status then
			cmake.clangd_on_new_config(new_config)
		end
	end,
})
require('lspconfig').gopls.setup({})
require('lspconfig').texlab.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').marksman.setup({})

