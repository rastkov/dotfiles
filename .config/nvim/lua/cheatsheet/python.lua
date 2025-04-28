-- lua/cheatsheet/python.lua

local M = {}

function M.show()
  local content = {
    "🐍 Python Dev Cheatsheet",
    "",
    "🧼 Formatting:",
    "  :ConformInfo        → Show formatters",
    "  :Format             → Run black + isort",
    "",
    "🚨 Linting:",
    "  :lua require('lint').try_lint()  → Run flake8 + mypy",
    "",
    "🧪 Testing (if using neotest):",
    "  :Neotest run         → Run nearest test",
    "  :Neotest summary     → Toggle test summary",
    "  :Neotest output      → Show test output",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  local width = math.floor(vim.o.columns * 0.6)
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
