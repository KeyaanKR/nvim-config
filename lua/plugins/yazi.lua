return {
    {
        "mikavilpas/yazi.nvim",
        cmd = "Yazi",
        config = function()
            require("yazi").setup({
                open_for_directories = true, -- Opens yazi when `nvim .` is executed
                quit_on_open = true, -- Quits Yazi after opening a file
            })
        end,
    },
}
