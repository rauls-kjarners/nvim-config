return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.config = opts.config or {}
      -- astrocommunity.pack.python may bring basedpyright; force plain pyright
      opts.config.basedpyright = { autostart = false }
      opts.config.pyright = opts.config.pyright or {}
      return opts
    end,
  },
}
