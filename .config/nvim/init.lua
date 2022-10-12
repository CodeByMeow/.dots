local status, impatient = pcall(require, "impatient")
if status then
	impatient.enable_profile()
end

require("katinbox.base")
require("katinbox.highlights")
require("katinbox.maps")
require("katinbox.plugins")
