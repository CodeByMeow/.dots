local status, devicon = pcall(require, "nvim-web-devicons")
if (not status) then return end

devicon.setup {
    override = {
        js = {
            icon = "",
            color = "#F7CF00",
            cterm_color = "185",
            name = "Js",
        },
        ["Dockerfile"] = {
            icon = "",
            color = "#238FE1",
            cterm_color = "59",
            name = "Dockerfile",
        },
        ["dockerfile"] = {
            icon = "",
            color = "#238FE1",
            cterm_color = "59",
            name = "Dockerfile",
        },
        ["csv"] = {
            icon = "",
            color = "#89e051",
            cterm_color = "113",
            name = "Csv",
        },
        ["fish"] = {
            icon = "",
            color = "#4d5a5e",
            cterm_color = "59",
            name = "Fish",
        },
        ["git"] = {
            icon = "",
            color = "#F14C28",
            cterm_color = "202",
            name = "GitLogo",
        },
        ["node_modules"] = {
            icon = "",
            color = "#E8274B",
            cterm_color = "161",
            name = "NodeModules",
        },
        ['package.json'] = {
            icon = "",
            color = "#e8274b",
            name = "PackageJson"
        },
        ['package-lock.json'] = {
            icon = "",
            color = "#7a0d21",
            name = "PackageLockJson"
        },
        ["pdf"] = {
            icon = "",
            color = "#b30b00",
            cterm_color = "124",
            name = "Pdf",
        },
        ["php"] = {
            icon = "",
            color = "#a074c4",
            cterm_color = "140",
            name = "Php",
        },
        ["py"] = {
            icon = "",
            color = "#ffbc03",
            cterm_color = "61",
            name = "Py",
        },
        [".env"] = {
            icon = "",
            color = "#faf743",
            cterm_color = "226",
            name = "Env",
        },
    }

}
