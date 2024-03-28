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

require('lspconfig').clangd.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').texlab.setup({})
