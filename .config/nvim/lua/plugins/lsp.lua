-- lua/plugins/lsp.lua

return {
  { 'williamboman/mason.nvim', config = true },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'pyright',
          'ansiblels',
          'terraformls',
          'yamlls',
          'jsonls',
          'html',
          'cssls',
          'helm_ls'
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'b0o/schemastore.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Generic setup for most servers
      local servers = {
        'bashls', 'pyright', 'terraformls',
        'jsonls', 'html', 'cssls', 'helm_ls'
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- AnsibleLS with virtualenv-aware Python interpreter
      lspconfig.ansiblels.setup({
        capabilities = capabilities,
        settings = {
          ansible = {
            python = {
              interpreterPath = vim.fn.getenv("VIRTUAL_ENV")
                and tostring(vim.fn.getenv("VIRTUAL_ENV")) .. "/bin/python"
                or "python3"
            },
          },
        },
      })

      -- YAML Language Server with SchemaStore and custom schema overrides
      local schemastore = require("schemastore")
      local custom_schemas = {
        -- Kubernetes
        ["https://json.schemastore.org/kubernetes.json"] = {
          "*.k8s.yaml",
          "k8s/*.yaml",
          "kubernetes/*.yaml",
        },
        -- Ansible - Not working at the moment - Need to review https://www.schemastore.org/json/ and how to load different scheemas for different parts of Ansible (inverntory, playbook, task file, etc.)
        --["https://json.schemastore.org/ansible-playbook.json"] = {
        --  "*.ansible.yml",
        --  "*.playbook.yml",
        --  "ansible/*.yaml",
        --  "roles/**/*.yaml",
        --},
      }

      -- Merge default schemas with custom overrides
      local merged_schemas = vim.tbl_extend("force", schemastore.yaml.schemas(), custom_schemas)

      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            validate = true,
            completion = true,
            hover = true,
            format = { enable = true },
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = merged_schemas,
          },
        },
      })

      -- Autoformat Terraform files on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.tf", "*.tfvars" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  },
}

