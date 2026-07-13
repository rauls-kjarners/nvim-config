return {
    {
        "f-person/auto-dark-mode.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                pcall(vim.cmd, "colorscheme gruvbox-material")
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                pcall(vim.cmd, "colorscheme gruvbox-material")
            end,
        },
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.gruvbox_material_enable_italic = 1
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_foreground = "mixed"
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.g.gruvbox_material_float_style = "blend"
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = function(_, opts)
            opts = type(opts) == "table" and opts or {}
            opts.colorscheme = "gruvbox-material"
            return opts
        end,
    },
}
