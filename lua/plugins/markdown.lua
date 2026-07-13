return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        -- Disable marksman — don't want it in Obsidian vault or anywhere else
        marksman = { autostart = false },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      enabled = false, -- Disabled by default, toggle manually
    },
  },
}
