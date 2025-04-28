-- yaml/kubernetes/ansible schema-aware editing tips

return {
  title = "🧬 YAML & Schema Cheatsheet",
  filetype = "yaml",
  content = [[
📘 SCHEMA-AWARE YAML EDITING

YAML schemas are automatically applied using `yaml-language-server` (yamlls)
via schemastore.nvim, if the file path or name matches.

────────────────────────────────────────────

📁 FILE NAMING RULES

✅ GitHub Actions:
  - .github/workflows/*.yml

✅ Kubernetes:
  - *.k8s.yaml (e.g., deployment.k8s.yaml, service.k8s.yaml)

✅ Ansible:
  - *.playbook.yml
  - *.ansible.yml

────────────────────────────────────────────

💡 TIP: If you're not getting validation or hover support, rename your file
to match one of the patterns above.

────────────────────────────────────────────

🧪 To test hover:
  1. Place cursor on a known field (e.g., `runs-on`, `metadata`)
  2. Press `K` or run `:lua vim.lsp.buf.hover()`

🧠 To see schema-based validation:
  - Mistype a field (e.g., `templat` in a Kubernetes manifest)
  - LSP should underline it and show diagnostics

────────────────────────────────────────────

📦 Powered by:
  - yamlls (yaml-language-server)
  - b0o/schemastore.nvim
]]
}

