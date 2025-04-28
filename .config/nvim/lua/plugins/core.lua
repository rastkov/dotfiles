-- lua/plugins/core.lua
-- Loads all plugin configs

return {
  { import = "plugins.theme" },
  { import = "plugins.lualine" },
  { import = "plugins.nvim-tree" },
  { import = "plugins.toggleterm" },
  { import = "plugins.telescope" },
  { import = "plugins.lsp" },
  { import = "plugins.completion" },
  { import = "plugins.treesitter" },
  { import = "plugins.surround" },
  { import = "plugins.whichkey" },
  { import = "plugins.lint" },
  { import = "plugins.snippets" },
  { import = "plugins.dap" },
  { import = "plugins.dap-ui" },
  { import = "plugins.others" },
}

