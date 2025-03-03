return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- Remove unwanted components like "gj"
        opts.sections.lualine_x = {
            "filetype",
            "diff",
        }
        table.insert(
            opts.sections.lualine_x,
            LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
                local clients = package.loaded["copilot"] and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
                    or {}
                return #clients > 0 and "Copilot Active" or "Copilot Off"
            end)
        )
    end,
}
