return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {"prettierd"}
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "rust_analyzer", "gopls", "tailwindcss", "clangd"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.gopls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.clangd.setup({})
      -- lspconfig.golines.setup({})
      -- lspconfig.gofumpt.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}
