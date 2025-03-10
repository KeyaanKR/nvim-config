return {
    {
        "metalelf0/base16-black-metal-scheme",
    },
    {
        "EdenEast/nightfox.nvim",
    },
    {
        "rose-pine/neovim",
        lazy = false, -- Ensures it's loaded immediately
        priority = 1000, -- Ensures it loads before other plugins
        config = function()
            -- Load the last selected colorscheme
            local colorscheme_file = vim.fn.stdpath("config") .. "/colorscheme.lua"
            if vim.fn.filereadable(colorscheme_file) == 1 then
                dofile(colorscheme_file) -- Apply saved colorscheme
            else
                vim.cmd("colorscheme rose-pine") -- Default colorscheme
            end
        end,
    },
}
