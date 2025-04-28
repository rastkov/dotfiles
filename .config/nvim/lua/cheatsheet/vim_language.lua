local M = {}

M.content = [[
# 🧠 Vim Language: Verbs + Nouns

Understanding how to combine **verbs (operators)** with **nouns (motions or text objects)** is the key to mastering Vim.

---

## 🔨 Verbs (Operators)

| Verb  | Action                     | Notes                                               |
|-------|----------------------------|-----------------------------------------------------|
| `d`   | delete                     | Removes the selected text                           |
| `c`   | change                     | Deletes and enters insert mode                      |
| `y`   | yank                       | Copies the text                                     |
| `>`   | indent                     | Indents the selection                               |
| `<`   | outdent                    | Shifts text to the left                             |
| `g~`  | toggle case                | Upper/lowercases characters                         |
| `gu`  | make lowercase             | Makes the target lowercase                          |
| `gU`  | make uppercase             | Makes the target uppercase                          |
| `!`   | filter through shell cmd   | Send text through external command (e.g. `sort`)    |

---

## 📦 Motions (Movements - Simple Nouns)

| Motion | Meaning                           | Example    |
|--------|-----------------------------------|------------|
| `w`    | to start of next word             | `dw`       |
| `e`    | to end of current/next word       | `de`       |
| `b`    | to beginning of word              | `db`       |
| `0`    | to beginning of line              | `d0`       |
| `^`    | to first non-blank char           | `d^`       |
| `$`    | to end of line                    | `d$`       |
| `G`    | to end of file                    | `dG`       |
| `{`    | to previous paragraph             | `d{`       |
| `}`    | to next paragraph                 | `d}`       |
| `fX`   | to next occurrence of `X`         | `df"`      |

---

## 🧱 Text Objects (Smart Nouns)

| Object | Description                        | Example    |
|--------|------------------------------------|------------|
| `iw`   | inner word                         | `ciw`      |
| `aw`   | a word (includes space)            | `daw`      |
| `i"`   | inside quotes                      | `ci"`      |
| `a"`   | around quotes                      | `da"`      |
| `ip`   | inner paragraph                    | `dip`      |
| `ap`   | a paragraph                        | `yap`      |
| `i)`   | inside parentheses                 | `di)`      |
| `a)`   | around parentheses                 | `da)`      |
| `it`   | inside HTML tag                    | `cit`      |
| `at`   | around HTML tag                    | `dat`      |

---

## 🔁 Combined Examples

| Command   | Explanation                                            |
|-----------|--------------------------------------------------------|
| `dw`      | delete from cursor to next word                        |
| `d$`      | delete to end of line                                  |
| `ci"`     | change text inside quotes                              |
| `da)`     | delete text around parentheses                         |
| `yap`     | yank a paragraph                                       |
| `gUiw`    | uppercase the inner word                               |
| `guaw`    | lowercase the word including surrounding space         |
| `>ip`     | indent the inner paragraph                             |
| `!iwsort` | send word through shell's `sort` command (not useful)  |

---

## 🔤 What Does `g` Mean in Vim?

The `g` key in Vim is a **prefix** that modifies or extends commands. It's used for:

| Command | Description                            |
|--------|-----------------------------------------|
| `gU`   | make text uppercase                     |
| `gu`   | make text lowercase                     |
| `g~`   | toggle case                             |
| `gg`   | go to top of file                       |
| `gq`   | format text (with `textwidth`)          |
| `gx`   | open URL or file under cursor (if set)  |
| `gd`   | go to local declaration (LSP aware)     |

Think of `g` as “go” or “grammar extension” — it modifies how verbs work or adds advanced movements.

---

## 🧠 Tips for Mastery

- Think in actions and targets: `verb + noun`
- Prefer **text objects** (`iw`, `ip`, etc.) for clarity and repeatability
- Design commands that work well with `.` for fast repetition
- Avoid overusing visual mode — use text objects where possible


# 🧱 Vim Text Objects & 🔁 Repeatability

---

## 🧱 Text Objects – Think Like a Programmer

Text objects allow you to refer to **semantic units of text**: words, quotes, brackets, tags, paragraphs, etc.

| Text Object | Description                            | Includes Surrounding? | Example Command |
|-------------|----------------------------------------|------------------------|-----------------|
| `iw`        | inner word                             | ❌ No                  | `ciw`           |
| `aw`        | a word                                 | ✅ Yes (space)         | `daw`           |
| `i"`        | inside double quotes                   | ❌ No                  | `di"`           |
| `a"`        | around double quotes                   | ✅ Yes                 | `da"`           |
| `ip`        | inner paragraph                        | ❌ No                  | `dip`           |
| `ap`        | a paragraph                            | ✅ Yes (with newline)  | `yap`           |
| `i)`/`i]`   | inside parentheses/brackets            | ❌ No                  | `ci)`           |
| `a)`/`a]`   | around parentheses/brackets            | ✅ Yes                 | `da)`           |
| `it`        | inside HTML tag                        | ❌ No                  | `cit`           |
| `at`        | around HTML tag                        | ✅ Yes                 | `dat`           |

> 💡 You can also use `i'`, `a'`, `i}`, `a}`, `ib`, `ab`, and more.

---

## 🧪 Why Text Objects Are Powerful

- **Context-aware**: `di"` deletes the string inside quotes, no matter where your cursor is within.
- **Composable**: Use with any verb (`d`, `c`, `y`, `>`, `<`, etc.).
- **Repeatable**: Work great with `.` to repeat the exact same change.

---

## 🔁 Repeatability with `.`
The `.` command in Vim repeats the **last change** — not just the last keystroke.

### ✅ Good Examples

| Command | What Happens                              | `.` Repeats? |
|---------|-------------------------------------------|--------------|
| `ciw`   | Change inner word                         | ✅ Yes       |
| `da"`   | Delete around quotes                      | ✅ Yes       |
| `>ip`   | Indent inner paragraph                    | ✅ Yes       |

### ⚠️ Bad Examples

| Command | Problem                                    | `.` Repeats? |
|---------|--------------------------------------------|--------------|
| Visual mode + `d` | Not well tracked                 | ❌ No        |
| Search + Visual   | May not preserve repeatability   | ❌ No        |

> 🧠 Tip: Avoid visual mode when possible. Use **text objects** to maintain `.`, `u`, and undo consistency.

---

## 💡 Best Practices

- Learn the **top 5 text objects**: `iw`, `aw`, `i"`, `ip`, `i)`.
- Compose edits with intent: `ciw`, `di"`, `dap`, etc.
- Use `.` after your change to repeat quickly.
- Use plugins like `vim-repeat` to improve `.`, especially with custom mappings.

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

