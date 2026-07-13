return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters["markdownlint-cli2"] = vim.tbl_deep_extend("force", lint.linters["markdownlint-cli2"] or {}, {
        args = { "-" },
        cwd = vim.fn.expand("~"),
      })
    end,
  },
}
