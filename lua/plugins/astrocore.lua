return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        undofile = true,
        undodir = vim.fn.stdpath("data") .. "/undo",
        wrap = false,
        cursorline = false,
        showtabline = 0,
        swapfile = false,
      },
    },
    autocmds = {
      auto_reload = {
        {
          event = { "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" },
          desc = "Aggressive auto-reload",
          callback = function()
            if vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) ~= "" and vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
              vim.cmd("checktime")
            end
          end,
        },
      },
      auto_save = {
        {
          event = { "FocusLost", "BufLeave" },
          desc = "Safe auto-save",
          callback = function()
            if vim.bo.buftype == "" and not vim.bo.readonly and vim.api.nvim_buf_get_name(0) ~= "" then
              vim.cmd("silent! update")
            end
          end,
        },
      },
      win_separator = {
        {
          event = "ColorScheme",
          desc = "WinSeparator highlight",
          callback = function()
            vim.api.nvim_set_hl(0, "WinSeparator", { link = "Keyword" })
            vim.api.nvim_set_hl(0, "SnacksWinSeparator", { link = "Keyword" })
          end,
        },
      },
    },
    mappings = {
      n = {
        ["<C-H>"] = false,
        ["<C-J>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Window Left" },
        ["<C-K>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Window Down" },
        ["<C-L>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Window Up" },
        ["<C-;>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Window Right" },
        ["j"] = { "h", desc = "Left" },
        ["k"] = { "j", desc = "Down" },
        ["l"] = { "k", desc = "Up" },
        [";"] = { "l", desc = "Right" },
        ["'"] = { ";", desc = "Repeat Search" },
        ["<S-l>"] = { "<cmd>bprev<CR>", desc = "Previous buffer" },
        ["<S-k>"] = { "<cmd>bnext<CR>", desc = "Next buffer" },
        ["<S-h>"] = false, -- Disable default AstroNvim mapping
        ["<leader>cM"] = {
          function()
            local current = vim.api.nvim_buf_get_name(0)
            local ok, target = pcall(vim.fn.input, "Move class to: ", current, "file")
            if not ok or target == "" or target == current then return end
            if vim.fn.executable("phpactor") == 0 then
              vim.notify("phpactor not found in PATH", vim.log.levels.ERROR)
              return
            end
            vim.cmd.update()
            local obj = vim.system({ "phpactor", "class:move", current, target }, { text = true }):wait()
            if obj.code ~= 0 then
              local err = obj.stderr ~= "" and obj.stderr or obj.stdout
              vim.notify("Phpactor move failed:\n" .. err, vim.log.levels.ERROR)
              return
            end
            local old_buf = vim.api.nvim_get_current_buf()
            vim.cmd.edit(target)
            pcall(vim.api.nvim_buf_delete, old_buf, { force = true })
            vim.api.nvim_echo({}, false, {})
            vim.cmd.checktime()
          end,
          desc = "Phpactor Class Move",
        },
        ["<C-->"] = { function() Snacks.terminal() end, desc = "Toggle Terminal" },
      },
      v = {
        ["j"] = { "h", desc = "Left" },
        ["k"] = { "j", desc = "Down" },
        ["l"] = { "k", desc = "Up" },
        [";"] = { "l", desc = "Right" },
        ["'"] = { ";", desc = "Repeat Search" },
      },
      o = {
        ["j"] = { "h", desc = "Left" },
        ["k"] = { "j", desc = "Down" },
        ["l"] = { "k", desc = "Up" },
        [";"] = { "l", desc = "Right" },
        ["'"] = { ";", desc = "Repeat Search" },
      },
      t = {
        ["<C-H>"] = false,
        ["<C-J>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" },
        ["<C-K>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" },
        ["<C-L>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" },
        ["<C-;>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" },
      },
    },
  },
}