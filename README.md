# Neovim Configuration 🌙

[![CI](https://github.com/rauls-kjarners/nvim-config/actions/workflows/ci.yml/badge.svg)](https://github.com/rauls-kjarners/nvim-config/actions/workflows/ci.yml)
[![Neovim](https://img.shields.io/badge/Neovim-0.12+-blueviolet.svg)](https://neovim.io/)

Modern, strict, highly-extensible Neovim configuration built around [LazyVim](https://www.lazyvim.org/).

This repository contains purely editor configuration and UI logic. It is strictly decoupled from host system configuration to ensure maximum portability across macOS, Linux, SSH sessions, and containers. Protected by an automated CI pipeline ensuring zero startup errors.

## 🚀 Installation

Requires Neovim (>= **0.12.0**) installed

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repository
git clone https://github.com/rauls-kjarners/nvim-config ~/.config/nvim

# Start Neovim (Lazy.nvim will automatically bootstrap and install plugins)
nvim
```

## 📦 Dependencies

To keep this configuration portable, system-level dependencies and LSPs are intentionally **not** managed here. Ensure the host system (or Nix flake) provides:

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
