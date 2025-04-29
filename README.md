
# 📁 Dotfiles Management with a Bare Git Repository

This repository manages your personal configuration files (dotfiles) using a **bare Git repository**. This approach cleanly tracks your dotfiles in your `$HOME` directory without interfering with other Git repositories or leaving clutter behind.

Inspired by [Simon Toth’s article](https://medium.com/@simontoth/best-way-to-manage-your-dotfiles-2c45bb280049), this method is simple, elegant, and ideal for long-term maintainability.

---

## 🚀 Quick Start

### 1. Clone the Repository as a Bare Repo

```bash
git clone --bare git@github.com:yourusername/dotfiles.git $HOME/.dotfiles
```

### 2. Define the `dotfiles` Alias

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

> Tip: Add this to your shell config (`~/.bashrc`, `~/.zshrc`, etc.) to persist it.

### 3. Configure to Hide Untracked Files

```bash
dotfiles config --local status.showUntrackedFiles no
```

### 4. Check Out the Repository

```bash
dotfiles checkout
```

If files already exist, move or delete them before retrying the checkout.

---

## 🛠 Managing Dotfiles

### Add New Files

```bash
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles push
```

### Common Commands

```bash
dotfiles status
dotfiles diff
dotfiles log
```

---

## 📦 Best Practices

- Add the `alias` to your shell config for persistence.
- Use `.gitignore` to avoid tracking secrets (e.g. `.ssh`, `.gnupg`).
- Consider branching by environment (`work`, `home`, `server`, etc.).
- Optionally encrypt sensitive data with [git-crypt](https://github.com/AGWA/git-crypt).

---

## 📂 Example Directory Structure

```
$HOME/
├── .bashrc
├── .zshrc
├── .vimrc
├── .gitconfig
├── .config/
│   └── nvim/
└── .dotfiles/   # bare Git repository
```

---

## 🔁 Restoring on a New System

```bash
mkdir $HOME/.dotfiles
git clone --bare git@github.com:rastkov/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

---

## 🙋 FAQ

### Why Not a Regular Git Repo?

A regular repo places a `.git/` in your home directory, which can cause conflicts. A *bare* repo separates the Git internals from the working directory.

### Can I Use This With GitHub?

Yes. Push/pull as you would with any other repository. Private visibility is recommended.

---

## 📜 License

This setup is yours to customize. It is based on publicly shared practices in the Unix and Linux communities.
