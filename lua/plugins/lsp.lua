require("lspconfig").clangd.setup({
    cmd = { "clangd" },
    on_new_config = function(new_config, root_dir)
        if new_config.cmd then
            -- Check file type and adjust the standard accordingly
            if vim.bo.filetype == "c" then
                table.insert(new_config.cmd, "--std=c17") -- Use C17 for C files
            elseif vim.bo.filetype == "cpp" then
                table.insert(new_config.cmd, "--std=c++20") -- Use C++20 for C++ files
            end
        end
    end,
})
