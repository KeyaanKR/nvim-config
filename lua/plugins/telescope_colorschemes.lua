local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local M = {}

-- Function to save selected colorscheme
local function save_colorscheme(scheme)
    local config_path = vim.fn.stdpath("config") .. "/colorscheme.lua"
    local file = io.open(config_path, "w")
    if file then
        file:write("vim.cmd('colorscheme " .. scheme .. "')\n")
        file:close()
    else
        print("Error: Could not save colorscheme!")
    end
end

M.preview = function()
    local buf_content = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- Get current buffer content
    local filetype = vim.bo.filetype
    local original_colorscheme = vim.g.colors_name

    pickers
        .new({}, {
            prompt_title = "Select Colorscheme",
            finder = finders.new_table({
                results = vim.fn.getcompletion("", "color"),
            }),
            sorter = conf.generic_sorter({}),
            previewer = previewers.new_buffer_previewer({
                define_preview = function(self, entry, status)
                    local preview_bufnr = self.state.bufnr

                    -- Copy buffer content to preview
                    vim.api.nvim_buf_set_lines(preview_bufnr, 0, -1, false, buf_content)
                    vim.api.nvim_set_option_value("filetype", filetype, { buf = preview_bufnr })

                    -- Apply colorscheme only in preview window
                    vim.api.nvim_buf_call(preview_bufnr, function()
                        vim.cmd("colorscheme " .. entry[1])
                    end)

                    vim.cmd("redraw!") -- Ensure the preview updates
                end,
            }),
            attach_mappings = function(prompt_bufnr, map)
                -- Apply colorscheme permanently on Enter
                map("i", "<CR>", function()
                    local selection = action_state.get_selected_entry()
                    if selection then
                        local selected_scheme = selection[1]
                        vim.cmd("colorscheme " .. selected_scheme) -- Apply it
                        save_colorscheme(selected_scheme) -- Save for next session
                    end
                    actions.close(prompt_bufnr)
                end)

                return true
            end,
        })
        :find()
end

return M
