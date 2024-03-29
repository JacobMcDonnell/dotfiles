" Basic setup stuff
let mapleader=" "
set number relativenumber
filetype plugin on
syntax on
set wildmode=longest,list,full
set mouse=a
set colorcolumn=80
set autoindent noexpandtab tabstop=4 shiftwidth=4

" Quick Save
map <leader>w :w<CR>

" Spell check
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Open a terminal
map <leader>t :vsplit term://zsh<CR>

" Change Line break to 120
map <leader>l :set colorcolumn=120<CR>
" Change Line break to 80
map <leader>L :set colorcolumn=80<CR>

" Quick Netrw
map <leader>x :Ex<CR>

" Keyboard shortcuts for harpoon

map <leader>q :lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>
map <leader>a :lua require("harpoon"):list():append()<CR>
map <leader>n :lua require("harpoon"):list():next()<CR>
map <leader>p :lua require("harpoon"):list():prev()<CR>

" Telescope Keyboard shortcuts
map <leader>ts :Telescope find_files<CR>

" Removes spaces at the end of lines when saving
autocmd BufWritePre * %s/\s\+$//e

" Center Cursor when entering insert mode
autocmd InsertEnter * norm zz

" Fixing indenting visual block
vmap < <gv
vmap > >gv

" Makes splitting default to the right and to the bottom
set splitbelow splitright

" Remaps moving keys for splitting
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim' " Nice for reading Documents
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'tpope/vim-commentary' " Makes commenting multiple lines easier
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
call plug#end()

"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

let g:coc_global_extensions = [
	\ 'coc-html',
	\ 'coc-java',
	\ 'coc-tsserver',
	\ 'coc-css',
	\ 'coc-clangd',
	\ 'coc-go',
	\ 'coc-pairs',
	\ 'coc-python',
	\ 'coc-flutter'
	\ ]

lua vim.g.coq_settings = {auto_start = 'shut-up',}

lua require("dap_lldb")

" nvim-dap keybinds
map <leader>db :lua require("dap").toggle_breakpoint()<CR>
map <leader>dc :lua require("dap").continue()<CR>
map <leader>dso :lua require("dap").step_over()<CR>
map <leader>ds :lua require("dap").step_into()<CR>
map <leader>dr :lua require("dapui").open({ reset = true })<CR>
map <leader>dt :lua require("dapui").toggle()<CR>

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

" Commentary plugin
map <leader>c :Commentary \| set linebreak<CR>

" runs gofmt when closing a go file.
autocmd VimLeave *.go !gofmt -w %

" required for harpoon to run
:lua require("harpoon"):setup()

" This handles gofmt on save
" https://www.getman.io/posts/programming-go-in-neovim/
lua require("lsp_config")
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

set t_Co=256

set background=light  " for the light version of the theme

colorscheme PaperColor
