return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        enabled = true, -- Make sure it's enabled
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
            "hrsh7th/cmp-buffer", -- Buffer source
            "hrsh7th/cmp-path", -- Path source
            "L3MON4D3/LuaSnip", -- Snippet engine
        },
        config = function()
            local status_cmp, cmp = pcall(require, "cmp")
            if not status_cmp then
                vim.notify("nvim-cmp not found!", vim.log.levels.ERROR)
                return
            end
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
}
