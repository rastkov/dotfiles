-- lua/cheatsheet/dap.lua

local M = {}

function M.show()
  local content = {
    "🐞 DAP (Debugging) Shortcuts",
    "",
    "<F5>        → Start / Continue",
    "<F10>       → Step Over",
    "<F11>       → Step Into",
    "<F12>       → Step Out",
    "<leader>db  → Toggle Breakpoint",
    "<leader>dc  → Conditional Breakpoint",
    "<leader>dl  → Log Point",
    "<leader>dr  → Open DAP REPL",
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
