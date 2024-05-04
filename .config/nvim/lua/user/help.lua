local ns = vim.api.nvim_create_namespace("filetype.help")

local function ts_query_get_ranges(parser, root, query_string)
	local line_range = {}
	local query = vim.treesitter.query.parse(parser:lang(), query_string)
	for _, matches, _ in query:iter_matches(root, 0) do
		for _, match in ipairs(matches) do
			local start, _, _, stop, _, _ = unpack(vim.treesitter.get_range(match))
			if start ~= stop then
				table.insert(line_range, { start, stop })
			end
		end
	end
	return line_range
end

local function extmark_render_box(ranges, hl)
	for _, range in ipairs(ranges) do
		local start, stop = unpack(range)
		local lines = vim.api.nvim_buf_get_lines(0, start, stop, true)
		local max_line_width = vim.iter(lines):fold(0, function(acc, line)
			return math.max(acc, vim.fn.strdisplaywidth(line) + 2)
		end)

		-- If dashes are already present above line, we reuse that line for top border
		local dashes_above = lines[1]:match("^-*$") or lines[1]:match("^=*$")
		local border_top = "╭" .. ("─"):rep(max_line_width) .. "╮"
		if dashes_above then
			vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
				virt_text = { { border_top, hl } },
				virt_text_pos = "overlay",
			})
		else
			vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
				virt_lines = { { { border_top, hl } } },
				virt_lines_above = true,
			})
		end

		-- Render bottom border
		local border_bottom = "╰" .. ("─"):rep(max_line_width) .. "╯"
		vim.api.nvim_buf_set_extmark(0, ns, stop, 0, {
			virt_lines = { { { border_bottom, hl } } },
			virt_lines_above = true,
		})

		-- Render left and right border
		for i = start, stop - 1 do
			if i ~= start or not dashes_above then
				vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
					virt_text = { { "│ ", hl } },
					virt_text_pos = "inline",
				})
				vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
					virt_text = { { "│", hl } },
					virt_text_win_col = max_line_width + 1,
				})
			end
		end
	end
end

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("filetype.help", {}),
	pattern = "help",
	callback = function()
		local parser = vim.treesitter.get_parser()
		local tree = parser:parse(true)
		local root = tree[1]:root()

		local code_ranges = ts_query_get_ranges(parser, root, "(code) @v")
		local header_ranges = vim.iter({ "h1", "h2", "h3" }):fold({}, function(acc, type)
			return vim.list_extend(acc, ts_query_get_ranges(parser, root, string.format("(line . (%s)) @v", type)))
		end)

		-- If last line of buffer is present in ranges, you remove that range
		-- This is because, sometimes modeline is parsed as a heading
		header_ranges = vim.tbl_filter(function(range)
			return range[2] ~= vim.api.nvim_buf_line_count(0)
		end, header_ranges)

		vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
		extmark_render_box(code_ranges, "Comment")
		extmark_render_box(header_ranges, "Identifier")
	end,
})
