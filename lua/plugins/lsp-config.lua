return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "prettierd" }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "gopls", "tailwindcss", "html", "cssls", "emmet_language_server", "angularls", "mesonlsp", }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true }
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({
        root_dir = lspconfig.util.root_pattern("package.json"),
        single_file_support = false
      })
      -- lspconfig.gopls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_language_server.setup({
        filetypes = { "css", "html", "less", "sass", "scss", "javascript", "javascriptreact", "typescriptreact" }
      })
      lspconfig.angularls.setup({

      })
      -- lspconfig.angularls.setup({
      --   filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' },
      --   root_dir = function(fname)
      --     local util = require 'lspconfig.util'
      --     return util.root_pattern 'nx.json' (fname) or util.find_git_ancestor(fname)
      --   end,
      -- })
      lspconfig.mesonlsp.setup({})
      -- lspconfig.golines.setup({})
      -- lspconfig.gofumpt.setup({})

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "shadow"
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded"
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>da', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {})
    end
  }
}
