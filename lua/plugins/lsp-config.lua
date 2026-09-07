return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "elixirls", "gopls", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- rust_analyzer 由 rustup 提供（~/.cargo/bin），故意不放进 mason 的
			-- ensure_installed，否则会装第二份。
			local servers = {
				lua_ls = {},
				ts_ls = {
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				},
				elixirls = { cmd = { "elixir-ls" } },
				gopls = {},
				pyright = {},
				rust_analyzer = {},
			}

			for name, opts in pairs(servers) do
				opts.capabilities = capabilities
				lspconfig[name].setup(opts)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
