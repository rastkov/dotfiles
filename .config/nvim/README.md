# 🧠 Neovim Modern IDE Setup

This is a modular, Lua-based Neovim configuration optimized for full-stack development, DevOps tooling, and enhanced editing experiences.

---

## 🧱 Structure

```text
.config/nvim/
├── init.lua
├── lua/
│   ├── plugins/
│   │   ├── core.lua             -- Loads all plugin definitions
│   │   ├── theme.lua            -- Colorscheme (tokyonight)
│   │   ├── lualine.lua          -- Statusline
│   │   ├── nvim-tree.lua        -- File explorer
│   │   ├── toggleterm.lua       -- Terminal integration
│   │   ├── telescope.lua        -- Fuzzy finder
│   │   ├── lsp.lua              -- LSP + schema config
│   │   ├── completion.lua       -- Autocompletion with nvim-cmp
│   │   ├── treesitter.lua       -- Syntax highlighting and folding
│   │   ├── surround.lua         -- Text surrounding shortcuts
│   │   ├── whichkey.lua         -- Keybinding help menu
│   │   ├── others.lua           -- Misc plugins (commenting, autopairs, etc.)
│   │   ├── lint.lua             -- Linting with nvim-lint
│   │   ├── snippets.lua         -- Snippet engine (LuaSnip + friendly-snippets)
│   │   ├── format.lua           -- Formatting support (conform.nvim)
│   │   ├── dap.lua              -- Debugging config (Python, Bash)
│   │   ├── dap-ui.lua           -- Debugging UI
│   ├── config/
│   │   ├── keymaps.lua          -- All keybindings
│   │   ├── repl_send.lua        -- Code line/selection to REPL terminal
│   ├── cheatsheet/
│   │   ├── main.lua
│   │   ├── python.lua
│   │   ├── schemas.lua          -- YAML schema editing tips
```

---

## 🚀 Key Plugins & Features

### 📦 Plugin Overview Table

| File                 | Plugin Link                                                                                       | Description                                                                                     |
|----------------------|---------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| `theme.lua`          | [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)                                       | A modern, clean, and highly customizable theme.                                                 |
| `lualine.lua`        | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                      | A blazing-fast and minimal statusline plugin.                                                   |
| `nvim-tree.lua`      | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                                       | A file explorer tree for navigating and managing files.                                         |
| `toggleterm.lua`     | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                                     | Easily toggle floating or split terminal windows inside Neovim.                                 |
| `telescope.lua`      | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                                | A fuzzy finder over lists — files, buffers, LSP symbols, git commits, and more.                 |
| `lsp.lua`            | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                        | Configures built-in LSP support for intelligent code navigation, completion, and more.          |
| `completion.lua`     | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                   | Autocompletion engine with snippet and LSP integration.                                         |
| `treesitter.lua`     | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                             | Enhanced syntax highlighting and parsing powered by Tree-sitter.                                |
| `surround.lua`       | [nvim-surround](https://github.com/kylechui/nvim-surround)                                        | Easily add/change/delete surrounding characters like quotes, brackets, etc.                     |
| `whichkey.lua`       | [which-key.nvim](https://github.com/folke/which-key.nvim)                                         | Displays a popup with keybinding suggestions as you type.                                       |
| `others.lua`         | —                                                                                                 | Helper plugins not directly configured in separate files (e.g., icons, utilities).              |
| `lint.lua`           | [nvim-lint](https://github.com/mfussenegger/nvim-lint)                                            | Asynchronous linting engine for on-save diagnostics.                                            |
| `snippets.lua`       | [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Fast snippet engine with a large collection of community-contributed snippets.  |
| `format.lua`         | [conform.nvim](https://github.com/stevearc/conform.nvim)                                          | Pluggable formatter framework with LSP fallback and support for many languages.                 |
| `signature.lua`      | [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)                                 | Shows function signatures inline while typing, based on LSP.                                    |
| `dap.lua`            | [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                              | Core Debug Adapter Protocol engine. Provides debugging support for multiple languages.          |
| `dap-ui.lua`         | [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                            | Adds a sidebar UI for viewing variables, breakpoints, stacks, and scopes.                       |
| `mason-dap`          | [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)                            | Automatically installs and configures debug adapters like `debugpy` and `bash-debug-adapter`.   |
| `trouble.nvim`       | [trouble.nvim](https://github.com/folke/trouble.nvim)                                             | Sidebar diagnostics and LSP navigation UI                                                       |
| `todo-comments.nvim` | [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                                 | Highlight and search TODO/FIXME/NOTE/HACK comments with Telescope, QuickFix, and navigation     |
| `resession.nvim`     | [resession.nvim](https://github.com/stevearc/resession.nvim)                                      | Save and restore sessions with Telescope picker support, autosave, and per-project state        |

---

## 🔧 Setup Requirements

### 1. **NeoVim 0.10+**
Ensure you are running NeoVim v0.10 or later for full compatibility with `conform.nvim` and other plugins.

### 2. **Python Environment**
Create and activate a Python virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate
```

Install the required Python tools:

```bash
pip install black isort flake8 mypy
```

### 3. **Node.js**
Required for language servers like `pyright`.

Install via `nvm` (recommended):

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
```

Or install system-wide:

```bash
sudo apt update
sudo apt install nodejs npm
```

Check version:
```bash
node -v
```

### 4. **Install LSPs with Mason**
Launch Neovim and run:

```vim
:MasonInstall bashls pyright ansiblels terraformls yamlls jsonls html cssls helm_ls
```

### 5. **Install (rg - ripgrep)**
- [ripgrep (`rg`)](https://github.com/BurntSushi/ripgrep) is required for `todo-comments.nvim` to search TODOs across the project.  
  Install via: `sudo apt install ripgrep`

### 6. **Sync Plugins**
After setup, run:

```vim
:Lazy sync
```

---

## 🚀 How to Use

1. Clone or copy this config into your `~/.config/nvim/` (or `~/AppData/Local/nvim` on Windows)
2. Open Neovim — Lazy will auto-install plugins
3. Use:
   - `<leader>th` / `tv` / `tf` to toggle terminals
   - `<leader>sl` / `<leader>ss` to send lines or selections to terminal (REPL style)
   - `<leader>hh`, `<leader>hv`, `<leader>hp` for help/cheatsheets
4. Format Python code with `:Format`
5. Lint Python files with `:lua require("lint").try_lint()`

---

## 🧠 Additional Features

### 🔧 Formatters (via `conform.nvim`)
- `black` + `isort` for Python
- `terraform_fmt` for Terraform
- `prettier` for YAML and JSON
- `ansiblelint` for Ansible

Run formatting manually with `<leader>cf`.

### 🚨 Linters (via `nvim-lint`)
- `flake8`, `mypy` for Python

Triggered automatically on save, or manually with:
```vim
:lua require("lint").try_lint()
```

### ✂️ Snippet Support
- Powered by `LuaSnip` and `friendly-snippets`
- Custom snippets defined in `lua/snippets/python.lua`:
  - `print` → `print("")`
  - `def` → function definition
  - `main` → `if __name__ == "__main__"`

### 🧪 REPL Integration
- Send current line: `<leader>sl`
- Send visual selection: `<leader>ss`

### ✨ Misc UX Enhancements
- `<C-CR>` → Exit snippet mode and open line below (insert mode)
- `<Tab>`, `<S-Tab>` → Cycle through completion/snippet fields
- `<leader>hp` → Python developer cheatsheet

### 🔍 LSP Utilities
- `K` → Hover documentation popup
- `<leader>ca` → Show code actions (e.g., quick fixes)

### 🐛 Debugging Support (DAP)

This setup uses [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) for debugging Python and Bash.

- Managed via [mason-nvim-dap](https://github.com/jay-babu/mason-nvim-dap.nvim)
- Python adapter: `debugpy`
- Bash adapter: `bash-debug-adapter`
- UI sidebar automatically opens/closes with debug sessions

> ℹ️ If you're working in a Python virtual environment, the debug adapter will use the virtualenv's Python binary.
> This ensures consistent tool behavior (e.g. matching linters and formatters).
>
> The path is detected dynamically:
> ```lua
> local venv = os.getenv("VIRTUAL_ENV")
> local python_path = venv and (venv .. "/bin/python") or "python3"
> require("dap-python").setup(python_path)
> ```

> 🐍 `debugpy` **must be installed** in your virtual environment for debugging to work:
> ```bash
> pip install debugpy
> ```

---

## 🧬 YAML Schema-Aware Editing (Kubernetes, Ansible, GitHub Actions)

Schema support is enabled through `yaml-language-server` + `schemastore.nvim`.

### 🔍 Automatic schema detection for:
- GitHub Actions → `.github/workflows/*.yml`
- Kubernetes manifests → `*.k8s.yaml`, `k8s/*.yaml`
- Ansible playbooks → `*.ansible.yml`, `roles/**/*.yaml`

> ✅ If hover or validation isn't working, rename your file to match these patterns.

You can also **manually override schemas** in `lsp.lua`.


---

## ⌨️ Keybindings (extras)

| Keybinding    | Description                                      |
|---------------|--------------------------------------------------|
| `<leader>hs`  | Show schema-aware YAML editing cheatsheet        |
| `<leader>hp`  | Show Python cheatsheet                           |
| `<leader>ch`  | Show hover docs for item under cursor            |
| `<leader>cf`  | Format the current buffer (Conform)              |
| `<leader>db`  | Toggle breakpoint (DAP)                          |
| `<F5>`        | Start debug session (Python/Bash)                |
| `<leader>sl`  | Send current line to terminal REPL               |
| `<leader>ss`  | Send visual selection to terminal REPL           |
| `<leader>xx`  | Toggle Trouble diagnostics UI                    |
| `<leader>xw`  | Show workspace diagnostics (Trouble)             |
| `<leader>xd`  | Show current buffer diagnostics (Trouble)        |
| `<leader>xq`  | Show quickfix list in Trouble                    |
| `<leader>xl`  | Show location list in Trouble                    |
| `<leader>xr`  | Show LSP references using Trouble                |
| `<leader>st`  | Search TODO comments using Telescope             |
| `<leader>cq`  | Send TODOs to QuickFix list                      |
| `<leader>cl`  | Send TODOs to Location list                      |
| `]t`          | Jump to next TODO comment                        |
| `[t`          | Jump to previous TODO comment                    |
| `<leader>qs`  | Save current session                             |
| `<leader>ql`  | Load session from Telescope picker               |
| `<leader>qd`  | Delete a session                                 |


--

##  Other

* Which-key group mappings are defined in plugins/whichkey.lua
