vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Init setting, remap etc.
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>qq", vim.cmd.q)
vim.api.nvim_set_option("clipboard","unnamed")
