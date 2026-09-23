return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    ui = { enable = false }, -- <-- add this
    workspaces = {
      {
        name = "myvault",
        path = "~/vault/",
      },
      {
        name = "quartz",
        path = "~/projects/quartz_webvault/content",
      },
    },
    debug = true,
    follow_url_func = function(url)
      vim.ui.open(url)
    end,
  },
}
