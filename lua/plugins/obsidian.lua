local vault = vim.fn.resolve(vim.fn.expand("~/OneDrive/vaults/main"))

return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        lazy = true,
        event = {
            "BufReadPre " .. vault .. "/*.md",
            "BufNewFile " .. vault .. "/*.md",
        },
        cmd = { "Obsidian" },
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            legacy_commands = false,
            workspaces = {
                {
                    name = "main",
                    path = vault,
                },
            },
            daily_notes = {
                folder = "dailies",
            },
            ---@diagnostic disable-next-line: missing-fields
            templates = {
                folder = "templates",
            },
            -- Converts "My Project" to "my-project.md"
            note_id_func = function(title)
                return require("obsidian.builtin").title_id(title)
            end,
            picker = {
                name = "snacks.picker",
                note_mappings = {
                    insert_link = "<C-i>",
                },
            },
        },
    },
}
