require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {
            config = {
                icon_preset = "varied",
                icons = {
                    todo = {
                        done = {
                            icon = "D"
                        },
                        undone = {
                            icon = "U"
                        },
                        pending = {
                            icon = "P"
                        }
                    }
                }
            }
        },
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    }
}

vim.keymap.set("n", "<leader>ww", "<cmd>:Neorg workspace notes<cr>")
