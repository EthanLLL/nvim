vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Init setting, remap etc.
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_option("clipboard", "unnamed")
-- Remap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>bb", "<cmd>b#<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { noremap = true, silent = true })
-- leader ww, format and save
vim.keymap.set("n", "<leader>ww", function()
	vim.lsp.buf.format()
	vim.cmd("w")
end, { noremap = true, silent = true })
-- leader wq, format save and quit
vim.keymap.set("n", "<leader>wq", function()
	vim.lsp.buf.format()
	vim.cmd("w")
	vim.cmd("q")
end, { noremap = true, silent = true })
