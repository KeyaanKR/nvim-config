return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        opts.sections.lualine_c = {
            {
                "filename",
                path = 1, -- Shows relative path (directory > filename)
                symbols = { modified = "", readonly = "", unnamed = "" }, -- Remove extra symbols
            },
        }
        opts.sections.lualine_x = {
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
