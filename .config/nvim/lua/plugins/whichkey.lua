-- lua/plugins/whichkey.lua

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup()
    local wk = require("which-key")
    wk.add({
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug" },
      { "<leader>e", group = "explorer" },
      { "<leader>f", group = "fuzzy find" },
      { "<leader>h", group = "help/cheatsheets" },
      { "<leader>q", group = "sessions" },
      { "<leader>s", group = "send/snippets" },
      { "<leader>t", group = "terminal" },
      { "<leader>x", group = "diagnostics" },
    }, { mode = "n" })
  end,
}

