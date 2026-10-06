vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.mouse = "a"
vim.opt.list = true

vim.opt.listchars = {leadmultispace = "·", nbsp = "␣", tab = "» ", trail = "·"}

vim.api.nvim_create_autocmd({"BufWritePre"}, {command = "%s/\\s\\+$//e", pattern = {"*"}})

local default_colorscheme = "bluloco"
local colorscheme = os.getenv("NVIM_COLORSCHEME")

if (colorscheme == nil) then
    colorscheme = default_colorscheme
end

vim.cmd.colorscheme(colorscheme)
    
local background = os.getenv("NVIM_BACKGROUND")

if (background == nil) then
    background = "dark"
end

vim.cmd("set background=" .. background)

