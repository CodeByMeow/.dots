---@diagnostic disable: duplicate-set-field
local statusline_augroup = vim.api.nvim_create_augroup("gmr_statusline", { clear = true })

local function get_lsp_diagnostics_count(severity)
	if not rawget(vim, "lsp") then
		return 0
	end

	local count = vim.diagnostic.count(0, { severity = severity })[severity]
	if count == nil then
		return 0
	end

	return count
end

local function get_git_diff(type)
	local gsd = vim.b.gitsigns_status_dict
	if gsd and gsd[type] then
		return gsd[type]
	end

	return 0
end

local function mode()
	local mode_code = vim.api.nvim_get_mode().mode
	local mode_map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		[""] = "V-BLOCK",
		c = "COMMAND",
		R = "REPLACE",
		t = "TERM",
	}

	local display_mode = mode_map[mode_code] or mode_code
	return "%#StatusLine#" .. display_mode .. "%*"
end

local function lsp_active()
	if not rawget(vim, "lsp") then
		return ""
	end

	local current_buf = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.get_clients({ bufnr = current_buf })

	if #clients == 0 then
		return ""
	end

	local space = "%#Normal# %*"
	local lsp_names = {}

	for _, client in ipairs(clients) do
		table.insert(lsp_names, client.name)
	end

	local lsp_text = table.concat(lsp_names, ",")

	return space .. "%#Normal#" .. lsp_text .. "%*"
end

local function diagnostics_error()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.ERROR)
	if count > 0 then
		return string.format("%%#DiagnosticError# %se%%*", count)
	end

	return ""
end

local function diagnostics_warns()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.WARN)
	if count > 0 then
		return string.format("%%#DiagnosticWarn# %sw%%*", count)
	end

	return ""
end

local function diagnostics_hint()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.HINT)
	if count > 0 then
		return string.format("%%#DiagnosticHint# %sh%%*", count)
	end

	return ""
end

local function diagnostics_info()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.INFO)
	if count > 0 then
		return string.format("%%#DiagnosticInfo# %si%%*", count)
	end

	return ""
end

local lsp_progress = {
	client = nil,
	kind = nil,
	title = nil,
	percentage = nil,
	message = nil,
}

vim.api.nvim_create_autocmd("LspProgress", {
	group = statusline_augroup,
	desc = "Update LSP progress in statusline",
	pattern = { "begin", "report", "end" },
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		lsp_progress = {
			client = vim.lsp.get_client_by_id(args.data.client_id),
			kind = args.data.params.value.kind,
			message = args.data.params.value.message,
			percentage = args.data.params.value.percentage,
			title = args.data.params.value.title,
		}

		if lsp_progress.kind == "end" then
			lsp_progress.title = nil
			vim.defer_fn(function()
				vim.cmd.redrawstatus()
			end, 500)
		else
			vim.cmd.redrawstatus()
		end
	end,
})

local function lsp_status()
	if not rawget(vim, "lsp") then
		return ""
	end

	if vim.o.columns < 120 then
		return ""
	end

	if not lsp_progress.client or not lsp_progress.title then
		return ""
	end

	local title = lsp_progress.title or ""
	local percentage = (lsp_progress.percentage and (lsp_progress.percentage .. "%%")) or ""
	local message = lsp_progress.message or ""

	local lsp_message = string.format("%s", title)

	if message ~= "" then
		lsp_message = string.format("%s %s", lsp_message, message)
	end

	if percentage ~= "" then
		lsp_message = string.format("%s %s", lsp_message, percentage)
	end

	return string.format("%%#MsgArea#%s%%* ", lsp_message)
end

local function git_diff_added()
	local added = get_git_diff("added")
	if added > 0 then
		return string.format("%%#diffAdded#+%s%%*", added)
	end

	return ""
end

local function git_diff_changed()
	local changed = get_git_diff("changed")
	if changed > 0 then
		return string.format("%%#diffChanged#~%s%%*", changed)
	end

	return ""
end

local function git_diff_removed()
	local removed = get_git_diff("removed")
	if removed > 0 then
		return string.format("%%#diffRemoved#-%s%%*", removed)
	end

	return ""
end

local function git_branch_icon()
	return "%#Normal#%*"
end

local function git_branch()
	local branch = vim.b.gitsigns_head

	if branch == "" or branch == nil then
		return ""
	end

	return string.format("%%#Normal#%s%%*", branch)
end

local function full_git()
	local full = ""
	local space = "%#Normal# %*"

	local branch = git_branch()
	if branch ~= "" then
		local icon = git_branch_icon()
		full = full .. space .. icon .. space .. branch .. space
	end

	local added = git_diff_added()
	if added ~= "" then
		full = full .. added .. space
	end

	local changed = git_diff_changed()
	if changed ~= "" then
		full = full .. changed .. space
	end

	local removed = git_diff_removed()
	if removed ~= "" then
		full = full .. removed .. space
	end

	return full
end

local function python_env()
	local virtual_env = os.getenv("VIRTUAL_ENV_PROMPT")
	if virtual_env == nil then
		return ""
	end

	virtual_env = virtual_env:gsub("%s+", "") -- delete spaces
	return string.format("%%#StatusLineMedium# %s%%*", virtual_env)
end

local function file_percentage()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_line_count(0)

	return string.format("%%#Normal#  %d%%%% %%*", math.ceil(current_line / lines * 100))
end

local function total_lines()
	local lines = vim.fn.line("$")
	return string.format("%%#Normal#of %s %%*", lines)
end

local function formatted_filetype(hlgroup)
	local filetype = vim.bo.filetype or vim.fn.expand("%:e", false)
	return string.format("%%#%s# %s %%*", hlgroup, filetype)
end

StatusLine = {}

StatusLine.inactive = function()
	return table.concat({
		formatted_filetype("StatusLineMode"),
	})
end

local redeable_filetypes = {
	["qf"] = true,
	["help"] = true,
	["tsplayground"] = true,
}

StatusLine.active = function()
	local mode_str = vim.api.nvim_get_mode().mode
	if mode_str == "t" or mode_str == "nt" then
		return table.concat({
			mode(),
			"%=",
			"%=",
			file_percentage(),
			total_lines(),
		})
	end

	if redeable_filetypes[vim.bo.filetype] or vim.o.modifiable == false then
		return table.concat({
			formatted_filetype("StatusLineMode"),
			"%=",
			"%=",
			file_percentage(),
			total_lines(),
		})
	end

	local statusline = {
		mode(),
		" %t",
		"%r",
		"%m",
		full_git(),
		"%=",
		"%=",
		diagnostics_error(),
		diagnostics_warns(),
		diagnostics_hint(),
		diagnostics_info(),
		python_env(),
		lsp_status(),
		lsp_active(),
		file_percentage(),
		total_lines(),
		"%3l:%-2c ",
	}

	return table.concat(statusline)
end

vim.opt.statusline = "%!v:lua.StatusLine.active()"

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FileType" }, {
	group = statusline_augroup,
	pattern = {
		"NvimTree_1",
		"NvimTree",
		"TelescopePrompt",
		"fzf",
		"lspinfo",
		"lazy",
		"netrw",
		"mason",
		"noice",
		"qf",
		"mini",
	},
	callback = function()
		vim.opt_local.statusline = "%!v:lua.StatusLine.inactive()"
	end,
})
