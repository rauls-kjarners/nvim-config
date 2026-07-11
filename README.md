# Neovim Configuration 🌙

Modern, highly-extensible Neovim configuration built around [LazyVim](https://www.lazyvim.org/). 

This repository contains purely editor configuration and UI logic. It is decoupled from the host system configuration to ensure maximum portability across macOS, Linux, SSH sessions, and containers.

## 🚀 Installation

Ensure you have Neovim (>= 0.9.0) installed.

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repository
git clone https://github.com/YOUR_USERNAME/nvim-config ~/.config/nvim

# Start Neovim (Lazy.nvim will automatically bootstrap and install plugins)
nvim
```

## 📦 Dependencies

To keep this configuration portable, system-level dependencies and LSPs are intentionally **not** managed here. Ensure your host system (or Nix flake) provides:

- **Core:** `git`, `ripgrep`, `fd`, `lazygit`
- **Compilers:** `gcc` / `make` (for tree-sitter parsers)
- **Formatters/Linters:** Provided by host environment or Mason

## 📂 Structure

- `init.lua` - Entry point
- `lazyvim.json` - LazyVim configuration
- `lua/plugins/` - Custom plugin additions and LazyVim overrides

## 💡 Philosophy

- **Separation of Concerns:** Editor UI logic lives here. System binaries and LSP servers are managed by Nix.
- **Lazy by Default:** Fast startup times via aggressive lazy-loading.
