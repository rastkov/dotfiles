
-- lua/config/terminal.lua

-- Terminal mode hack since I'm using Bash in vi mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { buffer = true })
  end
})
