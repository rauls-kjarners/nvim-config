return {
  {
    "gbprod/substitute.nvim",
    keys = {
      { "s", function() require("substitute").operator() end, desc = "Substitute" },
      { "ss", function() require("substitute").line() end, desc = "Substitute Line" },
      { "S", function() require("substitute").eol() end, desc = "Substitute to EOL" },
      { "s", function() require("substitute").visual() end, mode = "x", desc = "Substitute in Visual" },
    },
    opts = {},
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sR",
        function() require("ssr").open() end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },
}