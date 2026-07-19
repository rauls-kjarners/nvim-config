-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Aggressive Auto-Reload: Check for file changes on idle or buffer enter
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("custom_auto_reload", { clear = true }),
    desc = "Aggressively check for file changes outside of Neovim",
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- Safe Auto-Save: Saves only on focus loss or buffer switch
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    desc = "Auto Save on focus lost and buffer leave",
    callback = function()
        -- Only save if the buffer has been modified, isn't read-only, and is a real file
        if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! update")
        end
    end,
})

-- Fix low-contrast grey text (like .gitignore) when switching light/dark modes
local function apply_contrast_fixes()
    if vim.o.background == "light" then
        local light_grey = "#504945"
        -- vim.api.nvim_set_hl(0, "Comment", { fg = light_grey, italic = true })
        vim.api.nvim_set_hl(0, "NonText", { fg = light_grey })
        vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = light_grey })
        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = light_grey })
    else
        local dark_grey = "#a89984"
        -- vim.api.nvim_set_hl(0, "Comment", { fg = dark_grey, italic = true })
        vim.api.nvim_set_hl(0, "NonText", { fg = dark_grey })
        vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = dark_grey })
        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = dark_grey })
    end
end

-- Apply immediately on startup
apply_contrast_fixes()

-- And apply whenever the theme changes dynamically
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = apply_contrast_fixes,
})
