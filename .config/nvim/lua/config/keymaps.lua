local opts = { noremap = true, silent = true }
local map = vim.keymap.set
vim.g.mapleader = " "

-- Toggle state for Colemak layout
local toggle_default_layout = false

-- Toggle Colemak layout mappings
local function toggle_layout()
    if toggle_default_layout then
        -- Enable Colemak mappings
        map("", "n", "j", opts)
        map("", "e", "k", opts)
        map("", "i", "l", opts)
        map("", "u", "i", opts)
        map("", "U", "I", opts)
        map("n", "vub", "vib", opts)
        map("n", "vuB", "viB", opts)
        vim.notify("Colemak layout activated", vim.log.levels.INFO)
    else
        -- Disable Colemak mappings (reset to default)
        vim.keymap.del("", "n")
        vim.keymap.del("", "e")
        vim.keymap.del("", "i")
        vim.keymap.del("", "u")
        vim.keymap.del("", "U")
        vim.keymap.del("n", "vub")
        vim.keymap.del("n", "vuB")
        vim.notify("Colemak layout deactivated", vim.log.levels.INFO)
    end
    -- Toggle state
    toggle_default_layout = not toggle_default_layout
end

-- Set the toggle keybinding
map("n", "<leader>lc", toggle_layout, opts)

-- Undo/redo mappings
map("n", "l", "u", opts)
map("x", "l", ":<C-U>undo<CR>", opts)

-- Do not yank with 'x'
map("n", "x", '"_x')

-- Save, quit, and close buffer
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>:bdelete<cr>", { desc = "Close buffer" })

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Split windows
map("n", "ss", ":split<Return><C-w>w", { silent = true })
map("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move between windows
map("n", "<leader><leader>", "<C-w>w")
map("n", "sh", "<C-w>h")
map("n", "sn", "<C-w>j")
map("n", "se", "<C-w>k")
map("n", "si", "<C-w>l")

-- Move lines and text
map("n", "<A-n>", ":m .+1<CR>")
map("n", "<A-e>", ":m .-2<CR>")
map("i", "<A-n>", "<ESC>:m .+1<CR>==gi")
map("i", "<A-e>", "<ESC>:m .-2<CR>==gi")
map("v", "<A-n>", ":m '>+1<CR>gv=gv")
map("v", "<A-e>", ":m '<-2<CR>gv=gv")

-- Escape highlight search
map("n", "<ESC>", "<cmd>:noh<cr>", opts)

-- Center search result
map("n", "m", "nzzzv")
map("n", "M", "Nzzzv")

-- Replace current text
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current text" })
map("c", "<C-e>", "<C-p>")

-- Switch tabs
map("n", "<Tab>", vim.cmd.bn)
map("n", "<S-Tab>", vim.cmd.bp)

-- Open file with xdg-open
map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

-- Exit terminal mode
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable internal "s"
map("n", "s", "<Nop>")
map("v", "s", "<Nop>")

-- Cowboy discipline
require("config.discipline").cowboy()
