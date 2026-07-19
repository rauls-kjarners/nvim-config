return {
    {
        "rauls-kjarners/omp.nvim",
        keys = {
            {
                "<leader>ao",
                function()
                    Snacks.terminal.toggle("omp", {
                        win = {
                            position = "right",
                            width = 0.4,
                        },
                    })
                end,
                desc = "Toggle Oh My Pi",
            },
        },
        opts = {},
    },
}
