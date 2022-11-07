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
            icon = " ",
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
        ["md"] = {
            icon = "",
            color = "#238FE1",
            cterm_color = "white",
            name = "Md",
        },
        [".gitignore"] = {
            icon = "",
            color = "#41535b",
            cterm_color = "59",
            name = "GitIgnore",
        },
        [".DS_Store"] = {
            icon = "",
            color = "#41535b",
            cterm_color = "59",
            name = "DsStore",
        },
        ["log"] = {
            icon = "",
            color = "#ffffff",
            cterm_color = "white",
            name = "Log",
        },
        ["lock"] = {
            icon = "",
            color = "#bbbbbb",
            cterm_color = "250",
            name = "Lock",
        },
        ["favicon.ico"] = {
            icon = "",
            color = "#cbcb41",
            cterm_color = "185",
            name = "Favicon",
        },
        ["html"] = {
            icon = "",
            color = "#e44d26",
            cterm_color = "202",
            name = "Html",
        },
        ["css"] = {
            icon = "",
            color = "#42a5f5",
            cterm_color = "39",
            name = "Css",
        },
        ["jpg"] = {
            icon = "",
            color = "#a074c4",
            cterm_color = "140",
            name = "Jpg",
        },
        ["jpeg"] = {
            icon = "",
            color = "#a074c4",
            cterm_color = "140",
            name = "Jpeg",
        },
        ["png"] = {
            icon = "",
            color = "#a074c4",
            cterm_color = "140",
            name = "Png",
        },
        ["gif"] = {
            icon = "",
            color = "#a074c4",
            cterm_color = "140",
            name = "Gif",
        },
        ["json"] = {
            icon = "",
            color = "#cbcb41",
            cterm_color = "185",
            name = "Json",
        },
        ["svg"] = {
            icon = "",
            color = "#FFB13B",
            cterm_color = "215",
            name = "Svg",
        },
        ["zip"] = {
            icon = "",
            color = "#FFB13B",
            cterm_color = "215",
            name = "Zip",
        },
        ["rar"] = {
            icon = "",
            color = "#FFB13B",
            cterm_color = "215",
            name = "Rar",
        },
        ["COMMIT_EDITMSG"] = {
            icon = "",
            color = "#41535b",
            cterm_color = "59",
            name = "GitCommit",
        },
        ["yml"] = {
            icon = "",
            color = "#6d8086",
            cterm_color = "66",
            name = "Yml",
        },
        ["yaml"] = {
            icon = "",
            color = "#6d8086",
            cterm_color = "66",
            name = "Yaml",
        },
        ["conf"] = {
            icon = "",
            color = "#6d8086",
            cterm_color = "66",
            name = "Conf",
        },
        ["ini"] = {
            icon = "",
            color = "#6d8086",
            cterm_color = "66",
            name = "Ini",
        },
        ["bash"] = {
            icon = "",
            color = "#89e051",
            cterm_color = "113",
            name = "Bash",
        },
        ["sh"] = {
            icon = "",
            color = "#4d5a5e",
            cterm_color = "59",
            name = "Sh",
        },
        ["txt"] = {
            icon = " ",
            color = "#89e051",
            cterm_color = "113",
            name = "Txt",
        },
    }

}
