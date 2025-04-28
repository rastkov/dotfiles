-- File: lua/plugins/toggleterm.lua
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "horizontal",
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        shade_terminals = true,
      })
    end,
  },
}

