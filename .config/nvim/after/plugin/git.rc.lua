local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
    keymaps = {
        -- Open blame window
        blame = "gl",
        -- Open file/folder in git repository
        browse = "go",
    }
})
