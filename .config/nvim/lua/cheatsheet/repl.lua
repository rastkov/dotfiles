
-- lua/cheatsheet/repl.lua

local M = {}

function M.show()
  local content = {
    "🔁 REPL Commands",
    "",
    "<leader>sl → Send current line to terminal",
    "<leader>ss → Send visual selection to terminal",
    "<C-CR>     → Exit snippet and start new line below"
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  local width = math.floor(vim.o.columns * 0.5)
  local height = #content + 2
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
  })
end

return M
