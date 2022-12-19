local status, impatient = pcall(require, "impatient")
if status then
  impatient.enable_profile()
end
require('katinbox.highlights')
require('katinbox.packer')
require("katinbox.remap")
require('katinbox.set')
