return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        enabled = true,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = true },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}
