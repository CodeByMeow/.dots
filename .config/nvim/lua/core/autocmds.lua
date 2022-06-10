local is_available = katvim.is_available
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local set_nornu = {
  pattern = "*",
  callback = function()
    vim.wo.rnu = false
  end
}

local set_rnu = {
  pattern = "*",
  callback = function()
    vim.wo.rnu = true
  end
}

if is_available "neo-tree.nvim" then
  augroup("neotree_start", { clear = true })
  cmd("BufEnter", {
    desc = "Open Neo-Tree on startup with directory",
    group = "neotree_start",
    callback = function()
      local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
      if stats and stats.type == "directory" then
        require("neo-tree.setup.netrw").hijack()
      end
    end,
  })
end

cmd("InsertEnter", set_nornu)
cmd("BufLeave", set_nornu)
cmd("FocusLost", set_nornu)
cmd("WinLeave", set_nornu)

cmd("BufEnter", set_rnu)
cmd("FocusGained", set_rnu)
cmd("InsertLeave", set_rnu)
cmd("WinEnter", set_rnu)
