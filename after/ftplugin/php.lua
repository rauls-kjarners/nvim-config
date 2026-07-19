-- after/ftplugin/php.lua
-- Loaded after all plugin ftplugins. PHP-specific keymaps only.
if vim.b.did_ftplugin_php_custom then
    return
end
vim.b.did_ftplugin_php_custom = true

local map = vim.keymap.set

-- Phpactor CLI: move class to a new file path
map("n", "<leader>cM", function()
    local current = vim.api.nvim_buf_get_name(0)
    local ok, target = pcall(vim.fn.input, "Move class to: ", current, "file")

    if not ok or target == "" or target == current then
        return
    end

    if vim.fn.executable("phpactor") == 0 then
        vim.notify("phpactor not found in PATH", vim.log.levels.ERROR)
        return
    end

    -- 1. Save if modified so Phpactor sees latest state
    vim.cmd.update()

    -- 2. Execute move
    local obj = vim.system({ "phpactor", "class:move", current, target }, { text = true }):wait()

    if obj.code ~= 0 then
        local err = obj.stderr ~= "" and obj.stderr or obj.stdout
        vim.notify("Phpactor move failed:\n" .. err, vim.log.levels.ERROR)
        return
    end

    -- Swap to new file and destroy the old deleted buffer
    local old_buf = vim.api.nvim_get_current_buf()
    vim.cmd.edit(target)
    pcall(vim.api.nvim_buf_delete, old_buf, { force = true })

    -- Clear lingering input message and reload updated imports
    vim.api.nvim_echo({}, false, {})
    vim.cmd.checktime()
end, { desc = "Phpactor: Move Class", buffer = true })
