vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>mk", vim.cmd.make)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)
vim.keymap.set("n", "<leader>%", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>\",", vim.cmd.split)
vim.keymap.set("t", "<C-e>", "<C-\\><C-n>")

local harpoon = require("harpoon")

local function _harpoon_list_()
    return harpoon:list():add()
end
vim.keymap.set("n", "<leader>a", _harpoon_list_)

local function _harpoon_menu_()
    return harpoon.ui:toggle_quick_menu(harpoon:list())
end
vim.keymap.set("n", "<leader>h", _harpoon_menu_)

local copyright_comment = require("copyright")
vim.keymap.set("n", "<leader>cr", copyright_comment)

