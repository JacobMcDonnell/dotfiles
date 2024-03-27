-- Lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	--{
	--	"NLKNguyen/papercolor-theme",
	--	config = function()
	--		vim.cmd('set t_Co=256')
	--		vim.cmd('set background=light')
	--		vim.cmd('colorscheme PaperColor')
	--	end
	--},
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        init = function()
          -- Like many other themes, this one has different styles, and you could load
          -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
          vim.cmd.colorscheme 'tokyonight-day'
        end,
    },
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
})
