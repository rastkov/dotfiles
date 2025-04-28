-- lua/plugins/dap.lua

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local mason_dap = require("mason-nvim-dap")
    local ui = require("dapui") 

    mason_dap.setup({
      ensure_installed = { "debugpy", "bash-debug-adapter" },
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    -- 🔁 Force adapter install if not present
    require("mason-registry").refresh(function()
      local registry = require("mason-registry")
      local packages = { "bash-debug-adapter", "debugpy" }
      for _, pkg in ipairs(packages) do
        local p = registry.get_package(pkg)
        if not p:is_installed() then
          p:install()
        end
      end
    end)

    -- Python
    local venv = os.getenv("VIRTUAL_ENV")
    local python_path = venv and (venv .. "/bin/python") or "python3"
    require("dap-python").setup(python_path)

    -- Bash adapter (via Node)
    dap.adapters.bashdb = {
      type = 'executable';
      command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
      name = 'bashdb';
    }
    
    dap.configurations.sh = {
      {
        type = 'bashdb';
        request = 'launch';
        name = "Launch file";
        showDebugOutput = true;
        pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
        pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
        trace = true;
        file = "${file}";
        program = "${file}";
        cwd = '${workspaceFolder}';
        pathCat = "cat";
        pathBash = "/bin/bash";
        pathMkfifo = "mkfifo";
        pathPkill = "pkill";
        args = {};
        env = {};
        terminalKind = "integrated";
      }
    }

    -- Keymaps
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP Conditional Breakpoint" })
    vim.keymap.set("n", "<leader>dl", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "DAP Log Point" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
  end,
}
