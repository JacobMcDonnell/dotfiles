vim.pack.add({
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        name = "plenary",
    },
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        name = "harpoon",
        version = "harpoon2",
    },
})

local harpoon = require("harpoon")
harpoon:setup()
