local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end
require "core"
require "core.options"

vim.defer_fn(function()
   require "core.mappings"
end, 0)

require("core.packer").bootstrap()
require "plugins"
