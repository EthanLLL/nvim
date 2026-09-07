return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- 只注册可执行文件真的存在的 source。none-ls 自己不做存在性检查，缺了会在
    -- 每次格式化时报 "command X is not executable"。
    local sources = {}
    local function add(builtin, cmd)
      if vim.fn.executable(cmd) == 1 then
        table.insert(sources, builtin)
      end
    end

    add(null_ls.builtins.formatting.stylua, "stylua")
    add(null_ls.builtins.formatting.prettier, "prettier")
    add(null_ls.builtins.formatting.black, "black")

    -- Go / Rust / Elixir 的格式化由各自的 LSP 完成（gofmt / rustfmt / mix
    -- format），不需要在这里注册。

    null_ls.setup({ sources = sources })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
