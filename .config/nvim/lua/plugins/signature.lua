
-- lua/plugins/signature.lua

return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    hint_enable = true,
    handler_opts = {
      border = "rounded"
    },
    hint_prefix = " ",
  }
}
