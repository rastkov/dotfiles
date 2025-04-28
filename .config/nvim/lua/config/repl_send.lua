local M = {}

function M.get_visible_toggleterm()
  local terms = require("toggleterm.terminal").get_all()
  for _, term in ipairs(terms) do
    if term:is_open() then return term end
  end
  return nil
end

function M.send_line()
  local term = M.get_visible_toggleterm()
  if not term then vim.notify("No open terminal", vim.log.levels.WARN); return end
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_chan_send(term.job_id, line .. "\n")
end

function M.send_visual()
  local term = M.get_visible_toggleterm()
  if not term then vim.notify("No open terminal", vim.log.levels.WARN); return end
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  vim.api.nvim_chan_send(term.job_id, table.concat(lines, "\n") .. "\n")
end

return M
