return {
  -- Disable inlay hints and default LSP virtual text
  {
    "AstroNvim/astrolsp",
    opts = {
      features = {
        inlay_hints = false,
      },
      diagnostics = {
        virtual_text = false,
      },
    },
  },

  -- Beautiful multiline box diagnostics (replaces default virtual text)
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require("tiny-inline-diagnostic").setup({
        signs = {
          arrow = " <- ",
        },
        options = {
          set_arrow_to_diag_color = true,
        },
      })
    end,
  },
}
