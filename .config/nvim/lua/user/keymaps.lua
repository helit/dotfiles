local later = require("user").setup()

-- general
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic under cursor" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- telescope binds
later(function()
	vim.keymap.set("n", "<leader>ff", function()
		require("telescope.builtin").find_files()
	end, { desc = "Find files" })

	vim.keymap.set("n", "<leader>fg", function()
		require("telescope.builtin").live_grep()
	end, { desc = "Live grep" })

	vim.keymap.set("n", "<leader>fb", function()
		require("telescope.builtin").buffers()
	end, { desc = "List buffers" })

	vim.keymap.set("n", "<leader>fh", function()
		require("telescope.builtin").help_tags()
	end, { desc = "Help tags" })
end)

-- neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle File Explorer" })

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })

vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

-- copilot
vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
