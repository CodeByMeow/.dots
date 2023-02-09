local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
    keymaps = {
        -- Open blame window
        blame = "<Leader>ll",
        -- Open file/folder in git repository
        browse = "<Leader>lo",
    }
})
