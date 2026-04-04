-- MY VIM MINIMAL CONFIG ;)

--      ..  ..    .....     woderLand
--      . ... ....     .....

-- ENCODING ....TO SUPPORT DIFF CHARACTERS SYMBOLS && LANGUAGES
vim.cmd([[ set encoding=UTF-8 ]])

-- LINE NUMBERING
vim.opt.number = true
vim.opt.relativenumber = true

-- UI
vim.opt.ruler = true

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = function()
		vim.wo.cursorline = false
	end
})
vim.opt.showmatch = true

-- WRAPPING && TEXT
vim.opt.wrap = true
vim.opt.linebreak = true
vim.bo.textwidth = 90

-- SEARCHING A TEXT
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- TABS AND INDENTATION
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.cmd("filetype plugin indent on")
vim.opt.smarttab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 1
vim.bo.tabstop = 4

-- SELECT LEADER KEY
vim.g.mapleader = " " -- set leader to space

-- CLEAR HIGHLIGHTS
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>")

-- VIM TERMGUI
vim.opt.termguicolors = true
