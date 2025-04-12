require("lspconfig").clangd.setup({
    cmd = { "clangd" },
    on_new_config = function(new_config, root_dir)
        local function is_c_file(filename)
            return filename:match("%.c$") ~= nil
        end

        local function is_cpp_file(filename)
            return filename:match("%.cpp$") or filename:match("%.cc$") or filename:match("%.cxx$")
        end

        -- Get the first opened file
        local first_file = vim.fn.argv(0) or ""

        -- Adjust the standard based on file type
        if is_c_file(first_file) then
            table.insert(new_config.cmd, "--std=c17")
        elseif is_cpp_file(first_file) then
            table.insert(new_config.cmd, "--std=c++20")
        end
        return new_config
    end,
})
