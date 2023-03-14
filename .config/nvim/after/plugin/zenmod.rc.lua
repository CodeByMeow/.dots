vim.keymap.set("n", "<leader>z", function()
    require("zen-mode").toggle({
        window = {
            width = .65 -- width will be 50% of the editor width
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
                enabled = true,
                -- ruler = false,              -- disables the ruler text in the cmd line area
                showcmd = false,            -- disables the command in the last line of the screen
            },
            twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
            gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = false },     -- disables the tmux statusline
            -- this will change the font size on alacritty when in zen mode
            -- requires  Alacritty Version 0.10.0 or higher
            -- uses `alacritty msg` subcommand to change font size
            alacritty = {
                enabled = false,
                font = "19", -- font size
            },
        },
    })
end)
