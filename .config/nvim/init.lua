-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.lsp.set_log_level("debug")

-- Load core settings
require('config.options')
require('config.keymaps')
require('config.repl_send')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins from lua/plugins/
require('lazy').setup('plugins')

-- Load terminal config
require("config.terminal")

-- Open sessions
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local resession = require("resession")
    local sessions = resession.list()
    if vim.fn.argc() == 0 and next(sessions) ~= nil then
      vim.schedule(function()
        resession.load() -- invokes Telescope or picker
      end)
    end
  end,
})

