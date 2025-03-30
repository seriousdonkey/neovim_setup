return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "go", "typescript", "rust", "html", "angular", "css", "scss", "html", "tsx", "svelte" },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
