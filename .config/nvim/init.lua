local status, impatient = pcall(require, "impatient")
if status then
   impatient.enable_profile()
end
require('base')
require('highlights')
require('maps')
require('plugins')
