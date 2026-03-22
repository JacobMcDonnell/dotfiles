(set vim.opt.nu true)

(set vim.opt.relativenumber true)

(set vim.opt.tabstop 4)

(set vim.opt.softtabstop 4)

(set vim.opt.shiftwidth 4)

(set vim.opt.expandtab true)

(set vim.opt.smartindent true)

(set vim.opt.wrap true)

(set vim.opt.swapfile false)

(set vim.opt.backup false)

(set vim.opt.undodir (.. (os.getenv :HOME) :/.vim/undodir))

(set vim.opt.undofile true)

(set vim.opt.hlsearch false)

(set vim.opt.incsearch true)

(set vim.opt.scrolloff 8)

(set vim.opt.signcolumn :yes)

(vim.opt.isfname:append "@-@")

(set vim.opt.updatetime 50)

(set vim.opt.colorcolumn :120)

(set vim.opt.mouse :a)

(set vim.opt.list true)

(set vim.opt.listchars {:leadmultispace "·"
                        :nbsp "␣"
                        :tab "» "
                        :trail "·"})

(vim.api.nvim_create_autocmd [:BufWritePre]
                             {:command "%s/\\s\\+$//e" :pattern ["*"]})

(local default_colorscheme :bluloco)
(local colorscheme (os.getenv :NVIM_COLORSCHEME))

(vim.cmd.colorscheme (if (= colorscheme nil) default_colorscheme
                             colorscheme))

(local background (os.getenv :NVIM_BACKGROUND))
(vim.cmd (.. "set background=" (if (= background nil) :dark
                                   background)))

