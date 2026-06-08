vim.keymap.set("n", "<leader>ou", function()
  local line = vim.api.nvim_get_current_line()

  -- extract reference id: [text][1]
  local ref = line:match("%[.-%]%[([^%]]+)%]")
  if not ref then
    vim.notify("No reference link found", vim.log.levels.ERROR)
    return
  end

  -- scan buffer for reference definition
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local url
  for _, l in ipairs(lines) do
    if l:match("^%[" .. vim.pesc(ref) .. "%]:") then
      url = l:match("^%[[^%]]+%]:%s*(%S+)")
      break
    end
  end

  if not url then
    vim.notify("Reference definition not found: [" .. ref .. "]", vim.log.levels.ERROR)
    return
  end

  -- clean trailing punctuation (common markdown annoyance)
  url = url:gsub("[%.,%)%]]+$", "")

  vim.ui.open(url)
end, { desc = "Open Markdown reference link" })

vim.api.nvim_create_user_command("C", function(opts)
  local start_line = opts.line1
  local end_line = opts.line2

  for lnum = start_line, end_line do
    local line = vim.fn.getline(lnum)
    if not line:match("^%s*#") then
      vim.fn.setline(lnum, "# " .. line)
    end
  end
end, { range = true })

vim.api.nvim_create_user_command("UC", function(opts)
  local start_line = opts.line1
  local end_line = opts.line2

  for lnum = start_line, end_line do
    local line = vim.fn.getline(lnum)
    local uncommented = line:gsub("^%s*#%s?", "", 1)
    vim.fn.setline(lnum, uncommented)
  end
end, { range = true })
