vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Init setting, remap etc.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
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
-- 只有当前 buffer 真的挂着支持格式化的 LSP client 时才格式化，否则
-- vim.lsp.buf.format() 会报 "no matching language servers"。
local function fmt_then(cmd)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client:supports_method("textDocument/formatting") then
      vim.lsp.buf.format()
      break
    end
  end
  vim.cmd(cmd)
end

-- leader ww, format and save
vim.keymap.set("n", "<leader>ww", function()
  fmt_then("w")
end, { noremap = true, silent = true })
-- leader wq, format save and quit
vim.keymap.set("n", "<leader>wq", function()
  fmt_then("wq")
end, { noremap = true, silent = true })
