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
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    { "nvim-treesitter/nvim-treesitter", tag = 'v0.10.0', build = ":TSUpdate" },
    { "mbbill/undotree" },
    { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { 'nvim-lua/plenary.nvim' } },
    {'neovim/nvim-lspconfig'},
    { "sainnhe/everforest" },
    {"Civitasv/cmake-tools.nvim"},
    {"frabjous/knap"},
})

