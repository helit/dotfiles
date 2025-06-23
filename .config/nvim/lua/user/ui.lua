-- theme
require("nightfox").setup({
	options = {
		-- Transparent background (true/false)
		transparent = false,

		-- Styles for different syntax groups
		styles = {
			comments = "italic",
			keywords = "bold",
			functions = "NONE",
			variables = "NONE",
		},

		-- Inverse highlights for matching parentheses, visual selection, etc.
		inverse = {
			match_paren = true,
			visual = false,
			search = false,
		},
	},
})

vim.cmd("colorscheme nightfox")

-- nvim tree setup
require("nvim-tree").setup({
	sort_by = "name",
	view = {
		width = 30,
		side = "left",
	},
	renderer = {
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
		},
	},
	git = {
		enable = true,
	},
	filters = {
		dotfiles = false,
	},
})

-- lualine
require("lualine").setup({
	options = {
		theme = "nightfox",
		section_separators = "",
		component_separators = "",
	},
})

-- bufferline
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		separator_style = "slant",
	},
})

-- lsp errors and hints
vim.fn.sign_define("DiagnosticSignError", {
	text = "",
	texthl = "DiagnosticSignError",
	numhl = "",
})

vim.fn.sign_define("DiagnosticSignWarn", {
	text = "",
	texthl = "DiagnosticSignWarn",
	numhl = "",
})

vim.fn.sign_define("DiagnosticSignInfo", {
	text = "",
	texthl = "DiagnosticSignInfo",
	numhl = "",
})

vim.fn.sign_define("DiagnosticSignHint", {
	text = "󰁔",
	texthl = "DiagnosticSignHint",
	numhl = "",
})

vim.cmd([[
  highlight! link DiagnosticUnderlineError DiagnosticError
  highlight! link DiagnosticUnderlineWarn DiagnosticWarn
  highlight! link DiagnosticUnderlineInfo DiagnosticInfo
  highlight! link DiagnosticUnderlineHint DiagnosticHint
]])

local function link_diagnostic_undercurl(from, to)
	local color = vim.api.nvim_get_hl(0, { name = from })
	vim.api.nvim_set_hl(0, to, {
		undercurl = true,
		sp = color.fg,
	})
end

link_diagnostic_undercurl("DiagnosticError", "DiagnosticUnderlineError")
link_diagnostic_undercurl("DiagnosticWarn", "DiagnosticUnderlineWarn")
link_diagnostic_undercurl("DiagnosticInfo", "DiagnosticUnderlineInfo")
link_diagnostic_undercurl("DiagnosticHint", "DiagnosticUnderlineHint")
