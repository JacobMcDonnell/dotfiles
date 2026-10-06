require("nvim-treesitter.configs").setup({
    auto_install = true, 
    ensure_installed = {"c"}, 
    highlight = {
        enable = true, 
        additional_vim_regex_highlighting = false
    }, 
    sync_install = false
})
