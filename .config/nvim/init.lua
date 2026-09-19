vim.o.scrolloff = 10
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.signcolumn = "yes"

vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true

vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = false

vim.o.wrap = true
vim.o.breakindent = true
vim.o.linebreak = true

vim.g.mapleader = " "

vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" }, 
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

vim.cmd.colorscheme("kanagawa-dragon")

require("lualine").setup {
	options = {
		icons_enabled = false,
		section_separators = '',
		component_separators = '',
	}
}
