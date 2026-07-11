-- Quality of life plugins
-- mini.move: move lines/selections; arrow keys avoid <A-jkl;> conflict with zellij pane nav

return {
    {
        "nvim-mini/mini.move",
        opts = {
            mappings = {
                left = "<A-Left>",
                right = "<A-Right>",
                down = "<A-Down>",
                up = "<A-Up>",
                line_left = "<A-Left>",
                line_right = "<A-Right>",
                line_down = "<A-Down>",
                line_up = "<A-Up>",
            },
        },
    },
}
