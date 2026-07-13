return {
  -- Disable aerial.nvim (AstroNvim core default)
  -- Crashes on Neovim 0.12 nightly treesitter changes, and you use trouble.nvim anyway.
  {
    "stevearc/aerial.nvim",
    enabled = false,
  },
}
