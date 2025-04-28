-- lua/plugins/format.lua

return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "isort", "black" },
        terraform = { "terraform_fmt" },
        yaml = { "prettier" },
        json = { "prettier" },
        ansible = { "ansiblelint" }, -- used as a formatter fallback
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end
}
