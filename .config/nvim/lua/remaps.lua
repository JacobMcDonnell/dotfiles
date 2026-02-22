vim.g.mapleader = " "

-- Netrw Directory Listing
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Quick Make
vim.keymap.set("n", "<leader>mk", vim.cmd.make)

-- Quick Save
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Swap down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Swap up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Concat line below with space
vim.keymap.set("n", "J", "mzJ`z")
-- Page down with recenter
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Page up with recenter
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Telescope keybinds
local tsBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tsBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fp', tsBuiltin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    tsBuiltin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Knap Keybinds
-- F5 processes the document once, and refreshes the view
vim.keymap.set('n', '<leader>kp', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
vim.keymap.set('n', '<leader>ks', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
vim.keymap.set('n', '<leader>ka', function() require("knap").toggle_autopreviewing() end)

