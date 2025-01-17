local opts = { noremap = true, silent = true }
local map = vim.keymap.set
vim.g.toggle_colemark = true
vim.g.mapleader = " "

local function active_layout()
	if vim.g.toggle_colemark then
		-- Activate Colemak layout
		map("", "n", "j", opts)
		map("", "e", "k", opts)
		map("", "i", "l", opts)
		map("", "u", "i", opts)
		map("", "U", "I", opts)
		map("n", "vub", "vib", opts)
		map("n", "vuB", "viB", opts)
		map("n", "vut", "vit", opts)
		map("n", "vuw", "viw", opts)
		map("n", "l", "u", opts)
		map("x", "l", ":<C-U>undo<CR>", opts)
	else
		-- Reset to default layout
		map("", "n", "n", opts)
		map("", "e", "e", opts)
		map("", "i", "i", opts)
		map("", "u", "u", opts)
		map("", "U", "U", opts)
	end
	-- Safely refresh Lualine if it is loaded
	if package.loaded["lualine"] then
		require("lualine").refresh()
	else
		vim.defer_fn(function()
			if package.loaded["lualine"] then
				require("lualine").refresh()
			end
		end, 50) -- Retry after 50ms
	end
end

local function toggle_layout()
	vim.g.toggle_colemark = not vim.g.toggle_colemark
	active_layout()
end

-- Set the toggle keybinding
map("n", "<leader>lc", toggle_layout, { desc = "Toggle Colemak layout" })

map("n", "x", '"_x')
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>:bdelete<cr>", { desc = "Close buffer" })
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")
map("n", "ss", ":split<Return><C-w>w", { silent = true })
map("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
map("n", "sh", "<C-w>h")
map("n", "sn", "<C-w>j")
map("n", "se", "<C-w>k")
map("n", "si", "<C-w>l")
map("n", "<A-n>", ":m .+1<CR>")
map("n", "<A-e>", ":m .-2<CR>")
map("i", "<A-n>", "<ESC>:m .+1<CR>==gi")
map("i", "<A-e>", "<ESC>:m .-2<CR>==gi")
map("v", "<A-n>", ":m '>+1<CR>gv=gv")
map("v", "<A-e>", ":m '<-2<CR>gv=gv")
map("n", "<ESC>", "<cmd>:noh<cr>", opts)
map("n", "m", "nzzzv")
map("n", "M", "Nzzzv")
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current text" })
map("c", "<C-e>", "<C-p>")
map("n", "<Tab>", vim.cmd.bn)
map("n", "<S-Tab>", vim.cmd.bp)
map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')
map("n", "s", "<Nop>")
map("v", "s", "<Nop>")

map("n", "H", function()
	return vim.lsp.buf.hover()
end)

map("n", "<leader>t", "<cmd>:ToggleTerm dir=%:p:h<CR>")
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

active_layout()
-- Cowboy discipline
require("config.discipline").cowboy()
