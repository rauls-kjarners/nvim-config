local exclude = {
    ".git/",
    "node_modules/",
    ".idea/",
    ".venv/",
    "__pycache__/",
    "dist/",
    "build/",
    ".next/",
    ".DS_Store",
}

return {
    {
        "folke/snacks.nvim",
        keys = {
            -- Terminal toggle workaround (Ctrl+/ translates to Ctrl+- via WezTerm/Herdr)
            {
                "<C-->",
                function()
                    Snacks.terminal()
                end,
                mode = { "n", "i", "t" },
                desc = "Toggle Terminal",
            },
        },
        opts = {
            picker = {
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                        exclude = exclude,
                        layout = {
                            preview = true,
                            layout = {
                                box = "vertical",
                                position = "left",
                                border = "none",
                                backdrop = false,
                                height = 0,
                                width = 50,
                                { win = "input", height = 1, border = "bottom" },
                                { win = "list", border = "none" },
                                { win = "preview", title = "{preview}", height = 20, border = "top" },
                            },
                        },
                        win = {
                            input = {
                                keys = {
                                    ["l"] = { "list_up", mode = "n" },
                                    ["k"] = { "list_down", mode = "n" },
                                    ["j"] = { "explorer_close", mode = "n" },
                                    [";"] = { "confirm", mode = "n" },
                                    ["h"] = false,
                                },
                            },
                            list = {
                                keys = {
                                    ["l"] = "list_up",
                                    ["k"] = "list_down",
                                    ["j"] = "explorer_close",
                                    [";"] = "confirm",
                                    ["h"] = false,
                                },
                            },
                        },
                    }, -- <leader>e (File Explorer)
                    files = {
                        hidden = true,
                        ignored = true,
                        exclude = exclude,
                    }, -- <leader>ff (Find Files)
                    smart = {
                        hidden = true,
                        ignored = true,
                        exclude = exclude,
                    }, -- <leader><space> (Smart Find Files)
                    grep = {
                        hidden = true,
                        ignored = true,
                        exclude = exclude,
                    }, -- <leader>sg (Live Grep)
                },
                win = {
                    input = {
                        keys = {
                            -- Adapt picker keys to j=left k=down l=up ;=right scheme
                            ["<C-j>"] = false,
                            ["<C-k>"] = { "list_down", mode = { "i", "n" } },
                            ["<C-l>"] = { "list_up", mode = { "i", "n" } },
                            ["j"] = false,
                            ["k"] = { "list_down", mode = "n" },
                            ["l"] = { "list_up", mode = "n" },
                        },
                    },
                    list = {
                        keys = {
                            ["j"] = false,
                            ["k"] = "list_down",
                            ["l"] = "list_up",
                        },
                    },
                },
            },
            terminal = {
                win = {
                    keys = {
                        nav_h = false,
                        nav_j = {
                            "<C-j>",
                            function(self)
                                return self:is_floating() and "<C-j>"
                                    or vim.schedule(function()
                                        vim.cmd.wincmd("h")
                                    end)
                            end,
                            desc = "Go to Left Window",
                            expr = true,
                            mode = "t",
                        },
                        nav_k = {
                            "<C-k>",
                            function(self)
                                return self:is_floating() and "<C-k>"
                                    or vim.schedule(function()
                                        vim.cmd.wincmd("j")
                                    end)
                            end,
                            desc = "Go to Lower Window",
                            expr = true,
                            mode = "t",
                        },
                        nav_l = {
                            "<C-l>",
                            function(self)
                                return self:is_floating() and "<C-l>"
                                    or vim.schedule(function()
                                        vim.cmd.wincmd("k")
                                    end)
                            end,
                            desc = "Go to Upper Window",
                            expr = true,
                            mode = "t",
                        },
                        nav_semi = {
                            "<C-;>",
                            function(self)
                                return self:is_floating() and "<C-;>"
                                    or vim.schedule(function()
                                        vim.cmd.wincmd("l")
                                    end)
                            end,
                            desc = "Go to Right Window",
                            expr = true,
                            mode = "t",
                        },
                    },
                },
            },
            styles = {
                terminal = {
                    height = 20,
                },
                lazygit = {
                    width = 0, -- fullscreen
                    height = 0,
                },
            },
        },
    },
}
