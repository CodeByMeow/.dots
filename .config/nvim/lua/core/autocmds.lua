local cmd = vim.api.nvim_create_autocmd
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

cmd("InsertEnter", set_nornu)
cmd("BufLeave", set_nornu)
cmd("FocusLost", set_nornu)
cmd("WinLeave", set_nornu)

cmd("BufEnter", set_rnu)
cmd("FocusGained", set_rnu)
cmd("InsertLeave", set_rnu)
cmd("WinEnter", set_rnu)

