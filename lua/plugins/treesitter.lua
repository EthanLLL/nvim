return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
    -- treesitter setup
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "elixir", "heex", "eex", "c", "lua", "vim", "python", "javascript", "html", "css"},
      highlight = { enable = true },
      indent = { enable = true},
    })
  end
}
