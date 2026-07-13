return {
  -- Quick file bookmarks (was lazyvim extras.editor.harpoon2)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon: add file" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon: menu" },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon: file 1" },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon: file 2" },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon: file 3" },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon: file 4" },
    },
  },

  -- Incremental rename with preview (was lazyvim extras.editor.inc-rename)
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    opts = {},
    keys = {
      {
        "<leader>cr",
        function() return ":IncRename " .. vim.fn.expand("<cword>") end,
        expr = true,
        desc = "LSP: rename (incremental)",
      },
    },
  },

  -- Increment/decrement dates, hex, booleans, etc (was lazyvim extras.editor.dial)
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment" },
      { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement" },
      { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "v", desc = "Increment" },
      { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v", desc = "Decrement" },
      { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment (sequential)" },
      { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement (sequential)" },
      { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v", desc = "Increment (sequential)" },
      { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v", desc = "Decrement (sequential)" },
    },
  },

  -- Yank history with paste cycling (was lazyvim extras.coding.yanky)
  {
    "gbprod/yanky.nvim",
    opts = {},
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Yanky: put after" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Yanky: put before" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Yanky: gput after" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Yanky: gput before" },
      { "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Yanky: cycle back" },
      { "<C-S-p>", "<Plug>(YankyNextEntry)", desc = "Yanky: cycle forward" },
    },
  },

  -- Surround text objects (was lazyvim extras.coding.mini-surround)
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  -- Show current scope context at top of window (was lazyvim extras.ui.treesitter-context)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = { max_lines = 3 },
  },

  -- Project-wide find & replace panel
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
      { "<leader>sr", function() require("grug-far").open() end, desc = "Search & Replace (grug-far)" },
      { "<leader>sr", function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end, mode = "v", desc = "Search & Replace word (grug-far)" },
    },
  },

  -- Task runner
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Overseer: toggle" },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer: run task" },
    },
  },

  -- Database UI (vim-dadbod)
  { "tpope/vim-dadbod", cmd = "DB", lazy = true },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "DB: toggle UI" },
      { "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "DB: add connection" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "dbui" },
        callback = function()
          vim.keymap.set("n", "<C-j>", "<C-w>h", { desc = "Go to Left Window", remap = true, buffer = true })
          vim.keymap.set("n", "<C-k>", "<C-w>j", { desc = "Go to Lower Window", remap = true, buffer = true })
          vim.keymap.set("n", "<C-l>", "<C-w>k", { desc = "Go to Upper Window", remap = true, buffer = true })
          vim.keymap.set("n", "<C-;>", "<C-w>l", { desc = "Go to Right Window", remap = true, buffer = true })
        end,
      })
    end,
  },
  { "kristijanhusak/vim-dadbod-completion", dependencies = { "tpope/vim-dadbod" }, ft = { "sql", "mysql", "plsql" } },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "kristijanhusak/vim-dadbod-completion" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      -- Insert dadbod as a completion source for SQL files
      table.insert(opts.sources, { name = "vim-dadbod-completion" })
      return opts
    end,
  },
}
