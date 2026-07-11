local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },

        -- Mandatory Language Support (LSP, Linters, Formatters)
        { import = "lazyvim.plugins.extras.lang.php" },
        { import = "lazyvim.plugins.extras.lang.go" },
        { import = "lazyvim.plugins.extras.lang.python" },
        { import = "lazyvim.plugins.extras.lang.typescript" },

        -- Navigation
        { import = "lazyvim.plugins.extras.editor.harpoon2" },
        { import = "lazyvim.plugins.extras.editor.aerial" },
        { import = "lazyvim.plugins.extras.editor.inc-rename" },

        -- Coding helpers
        { import = "lazyvim.plugins.extras.coding.yanky" },
        { import = "lazyvim.plugins.extras.ai.copilot" },
        { import = "lazyvim.plugins.extras.coding.mini-surround" },
        { import = "lazyvim.plugins.extras.editor.dial" },

        -- DAP + Testing
        { import = "lazyvim.plugins.extras.dap.core" },
        { import = "lazyvim.plugins.extras.test.core" },
        { import = "lazyvim.plugins.extras.editor.overseer" },

        -- Language extras
        { import = "lazyvim.plugins.extras.lang.markdown" },
        { import = "lazyvim.plugins.extras.lang.yaml" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lang.vue" },
        { import = "lazyvim.plugins.extras.lang.tailwind" },
        { import = "lazyvim.plugins.extras.lang.nix" },

        -- Linting
        { import = "lazyvim.plugins.extras.linting.eslint" },

        -- Formatting + UI
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "lazyvim.plugins.extras.ui.treesitter-context" },

        -- Util
        { import = "lazyvim.plugins.extras.util.dot" },
        { import = "lazyvim.plugins.extras.util.rest" },

        -- import/override plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Custom plugins will load during startup.
        -- Advanced: set this to `true` to have all custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break the Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "dracula", "habamax" } },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
