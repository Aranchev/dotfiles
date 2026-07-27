return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "C-y", -- accept suggestion with Tab
          next = "C-n", -- jump to next suggestion
          prev = "C-p",
        },
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      -- toggle copilot on/off
      vim.keymap.set("n", "<leader>cp", function()
        if vim.g.copilot_enabled == false then
          vim.g.copilot_enabled = true
          vim.cmd("Copilot enable")
          vim.notify("Copilot enabled")
        else
          vim.g.copilot_enabled = false
          vim.cmd("Copilot disable")
          vim.notify("Copilot disabled")
        end
      end, { desc = "Toggle Copilot" })

      vim.g.copilot_enabled = true
    end,
  },
}
