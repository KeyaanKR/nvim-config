return {
    {
        "metalelf0/base16-black-metal-scheme",
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false, -- Ensures it's loaded immediately
        priority = 1000, -- Ensures it loads before other plugins
        config = function()
            vim.cmd("colorscheme nordfox")
        end,
    },
}
