-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use fzf-lua
vim.g.lazyvim_picker = "fzf-lua"

-- Use basedpyright as the default Python LSP
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Use the treesitter foldexpr for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
    paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
    cache_enabled = 0,
}

require("config.filetype")
