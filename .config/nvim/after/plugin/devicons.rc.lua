require 'nvim-web-devicons'.setup {
    color_icons = true,
    default = true,
    strict = true,
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        },
        ["readme.md"] = {
            icon = "",
            color = "#3789CB",
            name = "Readme"
        },
    },
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        },
        ["js"] = {
            icon = "",
            color = "#F0DB4F",
            name = "JavaScript"
        },
        ["php"] = {
            icon = "",
            color = "#6181B6",
            name = "PHP"
        }
    },
}
