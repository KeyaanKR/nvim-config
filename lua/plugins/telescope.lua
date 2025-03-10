return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    keys = {
        {
            "<leader>CS",
            function()
                require("plugins.telescope_colorschemes").preview() -- Changed from telescope_colorschemes to telescope_colorscheme
            end,
            desc = "Preview Colorschemes",
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
    end,
}
