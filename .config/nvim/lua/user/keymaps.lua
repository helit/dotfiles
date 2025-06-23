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

-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- bufferline
-- Move to next buffer
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })

-- Move to previous buffer
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

-- Go to buffer by number (1-9)
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		require("bufferline").go_to_buffer(i, true)
	end, { desc = "Go to buffer " .. i })
end

-- copilot chat
vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
