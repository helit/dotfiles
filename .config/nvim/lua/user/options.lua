vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menuone", "noinsert", "popup", "fuzzy" }

-- tabs & indentation
vim.opt.expandtab = true      -- use spaces instead of tabs 
vim.opt.shiftwidth = 2        -- indent by x spaces
vim.opt.tabstop = 2           -- a tab equals x spaces
vim.opt.softtabstop = 2       -- typing tab inserts x spaces
vim.opt.smartindent = true    -- auto-indent new lines

-- search behavior
vim.opt.ignorecase = true     -- ignore case in search...
vim.opt.smartcase = true      -- ..unless the search has capitals 

-- ui
vim.opt.cursorline = true     -- highlight current line
vim.opt.termguicolors = true  -- use true colors
vim.opt.signcolumn = "yes"    -- always show sign columns
vim.opt.wrap = false
vim.opt.number = true         -- show line numbers
vim.opt.updatetime = 1000

-- file handling
vim.opt.undofile = true       -- persistent undo
vim.opt.backup = false        -- don't write backup files
vim.opt.swapfile = false      -- don't write swap files

-- timeouts
vim.opt.timeoutlen = 300

