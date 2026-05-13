-- ~/.config/nvim/lua/plugins/markdown.lua

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({
        render_modes = { "i", "n" },

        heading = {
          enabled = true,
          border = false,
          border_virtual = false,
        },

        code = {
          enabled = true,
          border = "none",
          sign = false,
          width = "block",
          right_pad = 1,
          left_pad = 1,
        },

        -- =========================
        -- Footnote Support
        -- =========================
        footnote = {
          enabled = true,
          icon = "󰯔 ", -- nice footnote icon
          superscript = true, -- makes [2^] look like superscript
        },
      })

      -- =========================
      -- Highlights
      -- =========================
      local hl = vim.api.nvim_set_hl

      local function set_highlights()
        hl(0, "RenderMarkdownCode", { bg = "#080808" })
        hl(0, "RenderMarkdownCodeInline", { bg = "#080808" })
        hl(0, "@markup.raw.block", { bg = "#080808" })

        hl(0, "RenderMarkdownH1Bg", { bg = "#0A000A", fg = "#eaa105" })
        hl(0, "RenderMarkdownH2Bg", { bg = "#0A000A", fg = "#930bca" })
        hl(0, "RenderMarkdownH3Bg", { bg = "#0A000A", fg = "#4b7be3" })
        hl(0, "RenderMarkdownH4Bg", { bg = "#0A000A", fg = "#16a972" })
        hl(0, "RenderMarkdownH5Bg", { bg = "#0A000A", fg = "#bc2c2c" })
        hl(0, "RenderMarkdownH6Bg", { bg = "#0A000A", fg = "#91cde1" })
      end

      set_highlights()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_highlights,
      })

      -- =========================
      -- Folding
      -- =========================
      local function markdown_foldexpr()
        local line = vim.fn.getline(vim.v.lnum)
        local _, _, hashes = string.find(line, "^(#+)%s")
        if hashes then
          return ">" .. #hashes
        end
        return "="
      end

      _G.markdown_foldexpr = markdown_foldexpr

      -- =========================
      -- FileType Autocommands
      -- =========================
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "norg", "rmd", "org", "codecompanion" },
        callback = function(args)
          -- Folding
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "v:lua.markdown_foldexpr()"

          -- Disable diagnostics
          vim.diagnostic.enable(false, { bufnr = args.buf })

          -- Conceal for nice rendering
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = "nc"
        end,
      })
    end,
  },
}
