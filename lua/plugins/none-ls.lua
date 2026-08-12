return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        -- Elixir formatting is handled by the elixirls LSP (mix format), not
        -- none-ls. The mix_format builtin was removed from none-ls core (moved
        -- to none-ls-extras.nvim), so registering it here fails to load.
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
