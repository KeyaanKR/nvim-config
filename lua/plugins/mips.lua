return {
  "benknoble/vim-mips",
  config = function()
    -- Associate `.s` files with the MIPS filetype
    vim.filetype.add({
      extension = {
        s = "mips",
      },
    })
  end,
}
