return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "myvault",
        path = "~/vault/",
      },
    },

    debug = true,

    daily_notes = {
      folder = "",
      date_format = "%Y-%m-%d",
      template = "daily.md",
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    follow_url_func = function(url)
      vim.ui.open(url)
    end,
  },
}
