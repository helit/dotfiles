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

-- mini pairs
add("echasnovski/mini.nvim")

require("mini.pairs").setup({})

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

-- copilot
add("zbirenbaum/copilot.lua")
add("zbirenbaum/copilot-cmp")
add("hrsh7th/nvim-cmp")
add("hrsh7th/cmp-nvim-lsp")

require("copilot").setup({
	suggestion = { enabled = true },
	panel = { enabled = false },
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
	}),
})

require("copilot_cmp").setup()

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
add("kyazdani42/nvim-tree.lua")
add("nvim-lualine/lualine.nvim")
add("akinsho/bufferline.nvim")
