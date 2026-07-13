return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "jaljoue/dracula-alucard.nvim",
    lazy = true,
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        pcall(vim.cmd, "colorscheme dracula")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        pcall(vim.cmd, "colorscheme dracula-alucard")

        vim.schedule(function()
          vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#14710A", bold = true })
          vim.api.nvim_set_hl(0, "NeotestFailed", { fg = "#CB3A2A", bold = true })
          vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#A34D14", bold = true })
          vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#846E15", bold = true })
          vim.api.nvim_set_hl(0, "NeotestWatching", { fg = "#846E15", bold = true })
          vim.api.nvim_set_hl(0, "NeotestDir", { fg = "#644AC9", bold = true })
          vim.api.nvim_set_hl(0, "NeotestFile", { fg = "#1F1F1F", bold = true })
          vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = "#A3144D", bold = true })
          vim.api.nvim_set_hl(0, "NeotestAdapterName", { fg = "#644AC9", bold = true })
          vim.api.nvim_set_hl(0, "NeotestMarked", { fg = "#C43F6E", bold = true })
          vim.api.nvim_set_hl(0, "NeotestIndent", { fg = "#6C664B" })
          vim.api.nvim_set_hl(0, "NeotestExpandMarker", { fg = "#9B9278" })

          local p_bg = "#F8F5E8"
          local l_bg = "#F5F1E3"
          local wb_bg = "#E8E4D8"
          local fg = "#1F1F1F"
          local muted = "#6C664B"
          local dim = "#9B9278"
          vim.api.nvim_set_hl(0, "GlancePreviewNormal", { fg = fg, bg = p_bg })
          vim.api.nvim_set_hl(0, "GlancePreviewEndOfBuffer", { fg = p_bg, bg = p_bg })
          vim.api.nvim_set_hl(0, "GlancePreviewBorderBottom", { fg = dim, bg = p_bg })
          vim.api.nvim_set_hl(0, "GlancePreviewLineNr", { fg = dim, bg = p_bg })
          vim.api.nvim_set_hl(0, "GlancePreviewSignColumn", { fg = p_bg, bg = p_bg })
          vim.api.nvim_set_hl(0, "GlanceListNormal", { fg = fg, bg = l_bg })
          vim.api.nvim_set_hl(0, "GlanceListEndOfBuffer", { fg = l_bg, bg = l_bg })
          vim.api.nvim_set_hl(0, "GlanceListBorderBottom", { fg = dim, bg = l_bg })
          vim.api.nvim_set_hl(0, "GlanceListFilepath", { fg = muted, bg = l_bg })
          vim.api.nvim_set_hl(0, "GlanceFoldIcon", { fg = muted, bg = l_bg })
          vim.api.nvim_set_hl(0, "GlanceIndent", { fg = dim })
          vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { fg = fg, bg = wb_bg, bold = true })
          vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { fg = muted, bg = wb_bg })
          vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { fg = "#644AC9", bg = wb_bg, bold = true })
          vim.api.nvim_set_hl(0, "GlanceBorderTop", { fg = dim, bg = wb_bg })
          vim.api.nvim_set_hl(0, "GlancePreviewCursorLine", { bg = "#CFCFDE" })
          vim.api.nvim_set_hl(0, "GlanceListCursorLine", { bg = "#CFCFDE" })
        end)
      end,
    },
  },
  {
    "rauls-kjarners/omp.nvim",
    lazy = false,
    keys = {
      {
        "<leader>ao",
        function()
          Snacks.terminal.toggle("omp", {
            win = { position = "right", width = 0.4 },
          })
        end,
        desc = "Toggle Oh My Pi",
      },
    },
    config = function()
      require("omp").setup()
    end,
  },
}