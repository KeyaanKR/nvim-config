return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--header-insertion-decorators",
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                init_options = {
                    -- This is important! Configure clangd to use different settings
                    -- based on filetype
                    compilationDatabasePath = "build",
                    fallbackFlags = { "-std=c11" }, -- Default to C11 for C files
                },
            },
        },
    },
}
