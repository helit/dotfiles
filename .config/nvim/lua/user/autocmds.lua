local group = vim.api.nvim_create_augroup("USER", {})

-- highlight yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- auto reload
local reload_group = vim.api.nvim_create_augroup("UserConfigReload", {})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = reload_group,
	pattern = vim.fn.stdpath("config") .. "/lua/user/*.lua",
	callback = function(opts)
		local file = vim.fn.fnamemodify(opts.file, ":t:r")
		local module = "user." .. file
		package.loaded[module] = nil
		require(module)
		vim.notify("Reloaded: " .. module, vim.log.levels.INFO)
	end,
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local conform = require("conform")
		conform.format({ async = false })
	end,
})
