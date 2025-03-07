local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "

-- Toggle Colemak layout flag
vim.g.toggle_colemark = true

local function clear_mappings()
	local modes = { "n", "v", "x", "i" }
	local keys = { "n", "e", "i", "u", "U", "l" }
	for _, mode in ipairs(modes) do
		for _, key in ipairs(keys) do
			pcall(vim.api.nvim_del_keymap, mode, key)
		end
	end
end

local function active_layout()
	-- Always clear existing mappings first
	clear_mappings()

	if vim.g.toggle_colemark then
		-- Normal and Visual mode mappings
		local modes = { "n", "v", "x" }
		for _, mode in ipairs(modes) do
			map(mode, "n", "j", opts)
			map(mode, "e", "k", opts)
			map(mode, "i", "l", opts)
			map(mode, "u", "i", opts)
			map(mode, "U", "I", opts)
			map(mode, "l", "u", opts)
		end

		-- Specific mappings
		map("n", "vub", "vib", opts)
		map("n", "vuB", "viB", opts)
		map("n", "vut", "vit", opts)
		map("n", "vuw", "viw", opts)
		map("x", "l", ":<C-U>undo<CR>", opts)
		map("n", "cuw", "ciw", opts)
	else
		-- Reset to default layout
		local modes = { "n", "v", "x" }
		for _, mode in ipairs(modes) do
			map(mode, "n", "n", opts)
			map(mode, "e", "e", opts)
			map(mode, "i", "i", opts)
			map(mode, "u", "u", opts)
			map(mode, "U", "U", opts)
		end
	end

	-- Ensure Lualine refresh
	vim.defer_fn(function()
		if package.loaded["lualine"] then
			require("lualine").refresh()
		end
	end, 100)
end

local function toggle_layout()
	vim.g.toggle_colemark = not vim.g.toggle_colemark
	active_layout()
end

-- Toggle keybinding
map("n", "<leader>lc", toggle_layout, { desc = "Toggle Colemak layout" })

-- Misc keymaps
map("n", "x", '"_x')
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>:bd<cr>", { desc = "Close buffer" })
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Window splits and navigation
map("n", "ss", ":split<Return><C-w>w", { silent = true })
map("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
map("n", "wh", "<C-w>h")
map("n", "wn", "<C-w>j")
map("n", "we", "<C-w>k")
map("n", "wi", "<C-w>l")

-- Line movement
map("n", "<A-n>", ":m .+1<CR>")
map("n", "<A-e>", ":m .-2<CR>")
map("i", "<A-n>", "<ESC>:m .+1<CR>==gi")
map("i", "<A-e>", "<ESC>:m .-2<CR>==gi")
map("v", "<A-n>", ":m '>+1<CR>gv=gv")
map("v", "<A-e>", ":m '<-2<CR>gv=gv")

-- Search and replace
map("n", "<ESC>", "<cmd>:noh<cr>", opts)
map("n", "m", "nzzzv")
map("n", "M", "Nzzzv")
map("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current text" })

-- Command mode
map("c", "<C-e>", "<C-p>")

-- Buffer navigation
map("n", "<Tab>", vim.cmd.bn)
map("n", "<S-Tab>", vim.cmd.bp)

-- Open link
map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

-- Disable s key
map("n", "s", "<Nop>")
map("v", "s", "<Nop>")

-- Immediate initialization
active_layout()

-- Defer a second initialization to ensure plugin load
vim.defer_fn(function()
	active_layout()
end, 200)

return {
	active_layout = active_layout,
}
