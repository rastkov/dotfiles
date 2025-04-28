-- define your global keymaps here
-- Manualy configure formating for a file
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "Format current buffer" })

-- ToggleTerm keybindings
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })

-- Cheatsheet keybindings
vim.keymap.set('n', '<leader>hh', function()
  require('cheatsheet.general').show()
end, { desc = "Show Neovim Command Cheat Sheet" })

vim.keymap.set('n', '<leader>hv', function()
  require('cheatsheet.vim_language').show()
end, { desc = "Show Vim Language Cheat Sheet" })

-- Python cheatsheet keybindings
vim.keymap.set('n', '<leader>hp', function()
  require('cheatsheet.python').show()
end, { desc = "Show Python Dev Cheat Sheet" })

-- DAP (Debug Adapter Protocol) - For troubleshooting scripts
vim.keymap.set("n", "<leader>hd", function()
  require("cheatsheet.dap").show()
end, { desc = "Show DAP Cheatsheet" })

-- Show Schemas Help and Naming Conventions
vim.keymap.set("n", "<leader>hs", function()
  require("cheatsheet").show("schemas")
end, { desc = "Show YAML/Schema cheatsheet" })

-- Trouble.nvim keybindings
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  callback = function(event)
    if event.data == "trouble.nvim" then
      local trouble = require("trouble")
      vim.keymap.set("n", "<leader>xx", function() trouble.toggle("diagnostics") end, { desc = "Toggle Trouble (All Diagnostics)" })
      vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end, { desc = "Workspace Diagnostics" })
      vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end, { desc = "Buffer Diagnostics" })
      vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, { desc = "Quickfix List" })
      vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, { desc = "Location List" })
      vim.keymap.set("n", "<leader>xr", function() trouble.toggle("lsp_references") end, { desc = "LSP References (Trouble)" })
    end
  end,
})

-- TODO Comments navigation and tools (without Trouble)
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO comment" })
vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Search TODOs (Telescope)" })
vim.keymap.set("n", "<leader>cq", "<cmd>TodoQuickFix<CR>", { desc = "TODOs → QuickFix List" })
vim.keymap.set("n", "<leader>cl", "<cmd>TodoLocList<CR>", { desc = "TODOs → Location List" })

-- Session management (resession.nvim)
vim.keymap.set("n", "<leader>qs", function() require("resession").save() end, { desc = "Save session" })
vim.keymap.set("n", "<leader>ql", function() require("resession").load() end, { desc = "Load session" })
vim.keymap.set("n", "<leader>qd", function() require("resession").delete() end, { desc = "Delete session" })

-- Send current line to the active terminal
function _SEND_LINE_TO_TERM()
  local term = require("toggleterm.terminal").get_all()[1]
  if not term or not term:is_open() then
    vim.notify("No open terminal found.", vim.log.levels.WARN)
    return
  end
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_chan_send(term.job_id, line .. "\n")
end

-- REPL/Terminal send keybindings -- Send visual selection to the active terminal
function _SEND_VISUAL_TO_TERM()
  local term = require("toggleterm.terminal").get_all()[1]
  if not term or not term:is_open() then
    vim.notify("No open terminal found.", vim.log.levels.WARN)
    return
  end
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  vim.api.nvim_chan_send(term.job_id, table.concat(lines, "\n") .. "\n")
end

vim.keymap.set("n", "<leader>sl", _SEND_LINE_TO_TERM, { desc = "Send line to open terminal" })
vim.keymap.set("v", "<leader>ss", _SEND_VISUAL_TO_TERM, { desc = "Send selection to open terminal" })

vim.keymap.set('n', '<leader>hr', function()
  require('cheatsheet.repl').show()
end, { desc = "Show REPL Cheatsheet" })


-- LSP: Hover docs, code actions, rename
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })


