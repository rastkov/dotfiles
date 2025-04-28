-- File: lua/plugins/others.lua
return {
  { "b0o/schemastore.nvim" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    event = "VeryLazy",
  },
  {
    "stevearc/resession.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("resession").setup({
        autosave = {
          enabled = true,
          interval = 60, -- Save every 60 seconds if changes occurred
          notify = false,
        },
      })
    end,
  }
}

