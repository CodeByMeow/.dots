local git = require("git")

git.setup({
    keymaps = {
        -- Open blame window
        blame = "<Leader>ll",
        -- Open file/folder in git repository
        browse = "<Leader>lo",
    }
})
