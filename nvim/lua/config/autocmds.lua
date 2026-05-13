local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Snacks picker preview: better readability
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "snacks_picker_preview",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Markdown: enable line numbers (local to buffer)
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})

-- Python: absolute numbers only
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "python",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end,
})
