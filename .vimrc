set number relativenumber
set wildmode=longest,list,full
map <leader>o :setlocal spell! spelllang=en_us<CR>
autocmd BufWritePre * %s/\s\+$//e
