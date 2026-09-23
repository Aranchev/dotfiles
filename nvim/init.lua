-- === Kitty startup double-Enter fix ===
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    -- Disable Kitty keyboard protocol early
    io.stdout:write("\027[>1u")
    vim.cmd("redraw")
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    io.stdout:write("\027[<1u")
  end,
})

-- Extra safety
vim.opt.ttimeoutlen = 5
vim.opt.timeoutlen = 300
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.g.markdown_fenced_languages = {
  "html",
  "python",
  "bash=sh",
  "javascript",
  "json",
  "lua",
  "c",
  "cpp",
  "java",
  "ruby",
}

require("config.lazy")

vim.opt.cursorline = false
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
