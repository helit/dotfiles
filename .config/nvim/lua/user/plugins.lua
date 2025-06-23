local now, add, later = require("user").setup()

-- lsp config
add("neovim/nvim-lspconfig")

-- conform
add("stevearc/conform.nvim")

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		lua = { "stylua" },
	},
})

-- mini.nvim
add("echasnovski/mini.nvim")

require("mini.pairs").setup({})
require("mini.completion").setup({})

-- telescope
add("nvim-lua/plenary.nvim")
add("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
add("nvim-telescope/telescope.nvim")

require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		preview = {
			timeout = 500,
		},
		file_ignore_patterns = {
			"node_modules",
			"%.git/",
			"%.cache/",
		},
	},
})

-- neo-tree
add("MunifTanjim/nui.nvim")
add("nvim-neo-tree/neo-tree.nvim", {
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
})

require("neo-tree").setup({
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = false,
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		position = "left",
		width = 30,
		mappings = {
			["<space>"] = "toggle_node",
			["<cr>"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["q"] = "close_window",
		},
	},
})

-- copilot
add("zbirenbaum/copilot.lua")

require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<C-l>", -- or your preferred key
		},
	},
	panel = { enabled = false },
})

-- copilot chat
add("CopilotC-Nvim/CopilotChat.nvim", {
	dependencies = {
		"zbirenbaum/copilot.lua",
		"nvim-lua/plenary.nvim",
	},
	cmd = "CopilotChat",
})

require("CopilotChat").setup({
	-- Optional config
	debug = false,
	window = {
		layout = "float", -- or "vertical", "split"
		border = "rounded",
	},
})

-- which-key
add("nvim-tree/nvim-web-devicons")
add("folke/which-key.nvim")

require("which-key").setup({
	win = {
		border = "rounded", -- or "single", "double", "shadow"
	},
	layout = {
		spacing = 0,
		align = "center",
	},
})

-- theme
add("EdenEast/nightfox.nvim")
add("nvim-lualine/lualine.nvim")
add("akinsho/bufferline.nvim")
