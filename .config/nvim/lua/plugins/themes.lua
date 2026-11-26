vim.pack.add({
    { src = "https://github.com/sainnhe/everforest", name = "everforest", },
    { src = "https://github.com/nlknguyen/papercolor-theme", name = "papercolor-theme", },
    { src = "https://github.com/rktjmp/lush.nvim", name = "lush", },
    { src = "https://github.com/uloco/bluloco.nvim", name = "bluloco", },
    { src = "https://github.com/alljokecake/naysayer-theme.nvim", name = "naysayer", },
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine", },
    { src = "https://github.com/alexvzyl/nordic.nvim", name = "nordic", },
    { src = "https://github.com/sainnhe/sonokai", name = "sonokai", },
})

require("rose-pine").setup()
vim.cmd("colorscheme rose-pine")
