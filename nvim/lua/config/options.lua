vim.opt.wrap = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldcolumn = "1"
vim.opt.winbar = "%=%m %f"

-- General tab settings for all files
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 4 -- Spaces per indentation level
vim.o.tabstop = 4 -- Number of spaces per tab
vim.o.softtabstop = 4 -- Spaces when pressing <Tab>

-- Filetype-specific overrides (if needed)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
  end,
})
