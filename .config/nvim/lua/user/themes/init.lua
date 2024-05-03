local kanagawa = require("user.themes.kanagawa")
local everforest = require("user.themes.everforest")
local M = {}

local function setTheme(theme)
	M = theme
end

setTheme(everforest)

return M
