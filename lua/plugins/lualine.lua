return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- LazyVim's default lualine_z is just the clock (os.date("%R")); drop it
        opts.sections.lualine_z = {}
        return opts
    end,
}
