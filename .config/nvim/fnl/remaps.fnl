(set vim.g.mapleader " ")

(vim.keymap.set :n :<leader>pv vim.cmd.Ex)

(vim.keymap.set :n :<leader>mk vim.cmd.make)

(vim.keymap.set :n :<leader>w vim.cmd.w)

(vim.keymap.set :v :J ":m '>+1<CR>gv=gv")

(vim.keymap.set :v :K ":m '<-2<CR>gv=gv")

(vim.keymap.set :n :J "mzJ`z")

(vim.keymap.set :n :<C-d> :<C-d>zz)

(vim.keymap.set :n :<C-u> :<C-u>zz)

(vim.keymap.set :n :<C-h> :<C-w>h)

(vim.keymap.set :n :<C-j> :<C-w>j)

(vim.keymap.set :n :<C-k> :<C-w>k)

(vim.keymap.set :n :<C-l> :<C-w>l)

(vim.keymap.set :n :<leader>t vim.cmd.terminal)

(vim.keymap.set :n :<leader>% vim.cmd.vsplit)

(vim.keymap.set :n "<leader>\"" vim.cmd.split)

(vim.keymap.set :t :<C-e> "<C-\\><C-n>")

(local ts-builtin (require :telescope.builtin))

(vim.keymap.set :n :<leader>ff ts-builtin.find_files {})

(vim.keymap.set :n :<leader>fp ts-builtin.git_files {})

(vim.keymap.set :n :<leader>ps
                (fn []
                  (ts-builtin.grep_string {:search (vim.fn.input "Grep > ")})))

(local harpoon (require :harpoon))

(vim.keymap.set :n :<leader>a (fn [] (: (harpoon:list) :add)))

(vim.keymap.set :n :<leader>h
                (fn [] (harpoon.ui:toggle_quick_menu (harpoon:list))))

(vim.keymap.set :n :<leader>u vim.cmd.UndotreeToggle)

(vim.keymap.set :n :<leader>kp
                (fn []
                  ((. (require :knap) :process_once))))

(vim.keymap.set :n :<leader>ks
                (fn []
                  ((. (require :knap) :close_viewer))))

(vim.keymap.set :n :<leader>ka
                (fn []
                  ((. (require :knap) :toggle_autopreviewing))))
