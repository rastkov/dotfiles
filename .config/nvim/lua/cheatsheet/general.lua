local M = {}

M.content = [[
# 🧠 Neovim Command Cheat Sheet

## 🚀 Motion Commands

| Command              | Description                                                  |
|----------------------|--------------------------------------------------------------|
| `w`, `e`, `b`        | Move forward/backward by word                                |
| `gg`, `G`            | Go to beginning/end of file                                  |
| `H`, `M`, `L`        | Top, middle, bottom of screen                                |
| `%`                  | Jump between matching `()`, `{}`, `[]`                       |
| `*`, `#`             | Search forward/backward for word under cursor                |
| `f<char>`, `F<char>` | Jump to next/previous occurrence of `<char>` in line         |
| `}` / `{`            | Move by paragraph                                            |
| `t<char>`, `T<char>` | Jump **just before** next/previous `<char>` in line          |
| `;`, `,`             | Repeat last `f`, `F`, `t`, or `T` in same/opposite direction |
 
> 💡 Use `;` to repeat the last `f`/`t`/`F`/`T` motion forward, and `,` to reverse it.

 
## 🔃 Scrolling Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `<C-d>`              | Scroll **half page down**                                |
| `<C-u>`              | Scroll **half page up**                                  |
| `<C-f>`              | Scroll **full page down** (forward)                      |
| `<C-b>`              | Scroll **full page up** (backward)                       |
| `zz`                 | Center current line in window                            |
| `zt`                 | Move current line to the **top** of the screen           |
| `zb`                 | Move current line to the **bottom** of the screen        |


## 📝 Insert Mode Tricks

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `<C-o>`              | Run one Normal mode command, then return to Insert       |
| `<C-r><reg>`         | Insert contents of a register (e.g., `<C-r>"`)           |
| `<C-u>`              | Delete from cursor to beginning of line                  |
| `<C-w>`              | Delete previous word                                     |
| `<C-t>` / `<C-d>`    | Indent / un-indent in Insert mode                        |
| `<C-x><C-o>`         | Trigger omnifunc completion                              |


## 🔍 Search Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `/pattern`           | Search **forward** for `pattern`                         |
| `?pattern`           | Search **backward** for `pattern`                        |
| `n`                  | Repeat last search (same direction)                      |
| `N`                  | Repeat last search (opposite direction)                  |
| `*`                  | Search forward for word under cursor                     |
| `#`                  | Search backward for word under cursor                    |
| `:noh`               | Remove search highlighting                               |


## 🔖 Mark Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `ma`                 | Set mark `a` at the current cursor position              |
| `'a`                 | Jump to the line of mark `a`                             |
| `` `a ``              | Jump to the exact cursor position of mark `a`           |
| `:marks`             | Show all defined marks                                   |
| `d'a`                | Delete from current position to line of mark `a`         |


## 📋 Register Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `"aY`                | Yank current line into register `a`                      |
| `"ap`                | Paste contents of register `a`                           |
| `:reg`               | Show contents of all registers                           |
| `"*p`                | Paste from system clipboard (`*` for selection)          |
| `"+p`                | Paste from system clipboard (`+` for clipboard)          |


## 📼 Macro Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `qa`                 | Start recording macro into register `a`                  |
| `q`                  | Stop recording                                           |
| `@a`                 | Play macro from register `a`                             |
| `@@`                 | Repeat last macro                                        |
| `:reg`               | View all registers (macros, yanks, etc.)                 |


## 🗂️ Buffer Management

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `:ls` or `:buffers`  | List open buffers                                        |
| `:b <num>`           | Switch to buffer by number                               |
| `:bd`                | Delete current buffer (close file)                       |
| `:bwipeout`          | Wipe buffer (remove completely)                          |
| `:bnext` / `:bn`     | Go to next buffer                                        |
| `:bprev` / `:bp`     | Go to previous buffer                                    |
| `:b#`                | Switch to alternate buffer (last used)                   |
| `<leader>fb`         | (Telescope) Find and switch to buffer                    |


## 📂 Tabs, Splits & Window Management

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `:tabnew`            | Open a new tab                                           |
| `:tabclose`          | Close current tab                                        |
| `gt` / `gT`          | Go to next / previous tab                                |
| `:vsp` / `:sp`       | Vertical / horizontal split                              |
| `<C-w>w`             | Move between splits                                      |
| `<C-w>v`             | Split window vertically                                  |
| `<C-w>s`             | Split window horizontally                                |
| `<C-w>r`             | Rotate windows                                           |
| `<C-w>x`             | Swap buffers between splits                              |
| `<C-w>HJKL`          | Move window to far left/down/up/right                    |
| `<C-w>+` / `-`       | Increase/decrease height                                 |
| `<C-w>>` / `<`       | Increase/decrease width                                  |


## 🗔  Window Layout Tips

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `<C-w>w`             | Move to next split window                                |
| `<C-w>h/j/k/l`       | Move to left/down/up/right split                         |
| `<C-w>c`             | Close current split                                      |
| `<C-w>q`             | Quit current window                                      |
| `<C-w>o`             | Close all other splits (only current stays)              |
| `<C-w>=`             | Equalize window sizes                                    |
| `<C-w>r`             | Rotate window layout                                     |
| `<C-w>x`             | Swap buffers between windows                             |


## 🖥️ Terminal Mode & Management

Vim has a built-in terminal you can open in any split or tab.
This lets you run shell commands (like `bash`, `htop`, `python`, etc.) right inside your workflow.

---

### 🔧 Opening the Terminal

| Command                | Description                                            |
|------------------------|--------------------------------------------------------|
| `:terminal` or `:term` | Open terminal in current window                        |
| `:sp | term`           | Open terminal in **horizontal split**                  |
| `:vsp | term`          | Open terminal in **vertical split**                    |
| `:tabnew | term`       | Open terminal in a new tab                             |

---

### 🧭 Navigating & Escaping Terminal Mode

| Command           | Description                                                 |
|-------------------|-------------------------------------------------------------|
| `i`               | Enter insert mode (if not already)                          |
| `<C-\><C-n>`      | Exit terminal mode and return to Normal mode                |
| `:startinsert`    | Enter terminal insert mode from Normal mode                 |

> 💡 If you're using Bash in vi mode, you may want to map `<Esc><Esc>` to send `<C-\><C-n>` in terminal buffers.


## 🧩 Surround Commands (`nvim-surround`)

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `ysiw"`              | Surround current word with `"`                           |
| `ysiw(`              | Surround current word with `()`                          |
| `ysiw{`              | Surround current word with `{}`                          |
| `ysiw'`              | Surround current word with `'`                           |
| `ysiws`              | Surround word with a function call, e.g., `str(...)`     |
| `ds"`                | Delete surrounding `"`                                   |
| `cs"'`               | Change surrounding `"` to `'`                            |
| `S"` (visual)        | Surround selection with `"`                              |
| `S(` (visual)        | Surround selection with `()`                             |
| `S{` (visual)        | Surround selection with `{}`                             |
| `S'` (visual)        | Surround selection with `'`                              |


## 🧵 Manual Folding Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `zf#j`               | Create a fold from current line to `#` lines below       |
| `zfG`                | Create a fold until the end of file                      |
| `zd`                 | Delete the fold under cursor                             |
| `za`                 | Toggle fold under cursor (open ↔ close)                  |
| `zc`                 | Close fold                                               |
| `zo`                 | Open fold                                                |
| `zM`                 | Close all folds                                          |
| `zR`                 | Open all folds                                           |


## 🧱 ToggleTerm Usage Cheat Sheet

`toggleterm.nvim` integrates Neovim’s terminal in a flexible way with horizontal, vertical, and floating layouts. It’s perfect for REPL workflows (Python, Bash, Node.js, etc.).

---

### 🔄 Opening ToggleTerm Terminals

| Command             | Description                                                |
|------------------------------------|---------------------------------------------|
| `<C-\>`                            | Toggle last used terminal                   |
| `:ToggleTerm`                      | Open a terminal (respects default direction)|
| `:ToggleTerm direction=horizontal` | Open terminal in a horizontal split         |
| `:ToggleTerm direction=vertical`   | Open terminal in a vertical split           |
| `:ToggleTerm direction=float`      | Open terminal in a floating window          |

You can map these in `init.lua`:

```lua
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })
```

---

### 🎯 Sending Code to the Active Terminal

- Works with **any** REPL: Python, Bash, Node.js, etc.
- Requires you to open a terminal first manually using the above mappings

| Mapping              | Description                                              |
|----------------------|----------------------------------------------------------|
| `<leader>sl`         | Send current line to active terminal                     |
| `<leader>ss`         | Send visual selection to terminal                        |

> Uses `nvim_chan_send()` under the hood to send code directly into the terminal.

---

### 📏 Resizing and Moving Terminals (Built-in Vim Splits)

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `<C-w>h/j/k/l`       | Move between terminal and other splits                   |
| `<C-w>+` / `-`       | Increase/decrease terminal height                        |
| `<C-w>>` / `<`       | Increase/decrease terminal width                         |
| `:res +5`            | Manually resize window height                            |
| `:vert res +5`       | Manually resize width (vertical splits)                  |

---

### 🧠 Tips

- You can run any shell program: `python`, `bash`, `ipython`, `node`, etc.
- Use `<leader>sl/ss` mappings with any terminal you’ve manually opened.
- Float mode is useful for modal tools (e.g. `lazygit`, `htop`).
- Only one terminal is needed for repeated sends — we reuse it!


## 🔧 Shell Filter Examples (`!` operator)

The `!` operator in Vim lets you **pipe selected text to an external shell command** and replace it with the output.

### 🔤 Basic Syntax

```vim
!{motion}command
```

- `!` → shell filter operator  
- `{motion}` → what to send to the shell (like `iw`, `ip`, `}`, etc.)  
- `command` → shell command (e.g., `sort`, `jq`, `nl`, `uniq`)

---

### 🧪 Examples & Usefulness

| Command             | Description                                         | Useful? |
|---------------------|-----------------------------------------------------|---------|
| `!iw sort`          | Pipes **inner word** through `sort`                 | ❌      |
| `!ip sort`          | Sorts lines in the **inner paragraph**              | ✅      |
| `!} sort`           | Sorts from cursor to end of paragraph               | ✅      |
| `:'<,'>!sort`       | Sorts a **visually selected block**                 | ✅✅    |
| `!ap jq .`          | Pretty-prints JSON in a paragraph using `jq`        | ✅✅    |
| `!ip sort \\| uniq` | Sorts and removes duplicates                        | ✅✅    |
| `!ip nl`            | Adds line numbers to each line                      | ✅      |

---

### 💡 Tips

- Combine with `ip`, `}` or visual selection (`V`, then `!`) for real power.
- You can run **any shell command** this way (`awk`, `sed`, `tr`, `jq`, etc.)
- If using a non-bash shell (like `fish`), set your Vim shell manually:  
  ```vim
  :set shell=bash
  ```

## 📦 Sessions (resession.nvim)

Save and restore full editing sessions with files, layout, tabs, etc.


| Mapping              | Description                                              |
|----------------------|----------------------------------------------------------|
| ` <leader>qs`        | Save session for current working directory               | 
| ` <leader>ql`        | Load session (via Telescope picker)                      |
| ` <leader>qd`        | Delete session                                           |

Startup behavior:
  If no file is passed when launching Neovim AND sessions exist,
  a Telescope session picker will automatically open.

Session storage is project-aware, based on the current working directory.


## 🛠️ Custom Key Mappings

| Mapping              | Description                                              |
|----------------------|----------------------------------------------------------|
| `<leader>e`          | Toggle file explorer (`nvim-tree`)                       |
| `<leader>ff`         | Find files with Telescope                                |
| `<leader>fg`         | Live grep across files with Telescope                    |
| `<leader>fb`         | List open buffers with Telescope                         |


## 🧽 Formatting & Linting

| Keybinding      | Description                                   |
|-----------------|-----------------------------------------------|
| `<leader>cf`    | Format current file using `conform.nvim`      |
| `<leader>cl`    | Run linters manually (`nvim-lint`)            |
| `<leader>cq`    | Populate QuickFix list with TODOs             |
| `<leader>cl`    | Populate Location list with TODOs             |

> Formatters are automatically applied on save (if supported).
> Linters run on save, but can also be triggered manually with `<leader>cl`.

Supported tools per filetype:
- **Python**: `black`, `isort`, `mypy`, `flake8`
- **Bash**: `shfmt`, `shellcheck`
- **YAML/Ansible**: `yamllint`, `ansible-lint`
- **Terraform**: `terraform fmt`, `tflint`
- **JSON, HTML, CSS**: `prettier` (if installed)


## 🧠 LSP (Language Server Protocol)

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `gd`                 | Go to definition                                         |
| `gD`                 | Go to declaration                                        |
| `gi`                 | Go to implementation                                     |
| `gr`                 | Show references                                          |
| `K`                  | Hover doc (show type info, docs)                         |
| `<leader>rn`         | Rename symbol                                            |
| `<leader>ca`         | Code actions (refactor, quickfix, etc.)                  |
| `<leader>f`          | Format file                                              |
| `[d`, `]d`           | Previous/next diagnostic                                 |
| `<leader>e`          | Show diagnostics in a floating window                    |

## ✔  TODO Comments

| `<leader>st`  | Search TODO comments using Telescope          |
| `<leader>cq`  | Send TODOs to QuickFix list                   |
| `<leader>cl`  | Send TODOs to Location list                   |
| `]t`          | Jump to next TODO comment                     |
| `[t`          | Jump to previous TODO comment                 |


## 📌 Other Helpful Commands

| Command              | Description                                              |
|----------------------|----------------------------------------------------------|
| `:TSInstall <lang>`  | Install Treesitter parser for `<lang>`                   |
| `:TSInstallInfo`     | Show installed Treesitter parsers                        |
| `:checkhealth`       | Check Neovim setup and plugin health                     |

]]

function M.show()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(M.content, "\n"))
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })
end

return M
