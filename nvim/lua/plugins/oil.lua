return {
  "stevearc/oil.nvim",
  opts = {
    show_hidden = true, -- Show hidden files/folders like .config
    keymaps = {
      ["q"] = "actions.close",
    },
  },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open Oil (Parent Directory)",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
}
