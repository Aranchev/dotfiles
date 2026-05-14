return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- ✅ added this line
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
        styles = {
          comments = { "italic" },
          functions = { "bold" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          telescope = true,
          treesitter = true, -- ✅ optional: enables Catppuccin’s Tree-sitter integration
        },
      })

      vim.cmd.colorscheme("catppuccin")

      -- ✅ Safe require to avoid startup errors
      local ok, ts = pcall(require, "nvim-treesitter.configs")
      if ok then
        ts.setup({
          highlight = {
            enable = true,
            disable = { "markdown" },
          },
        })
      end

      -- Custom markdown colors
      vim.api.nvim_set_hl(0, "markdownH1", { fg = "#089e10", bold = true })
      vim.api.nvim_set_hl(0, "markdownH2", { fg = "#611855", bold = true })
    end,
  },
}
