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
        ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "gopls", "tailwindcss", "clangd", "html", "cssls", "emmet_language_server", "angularls" }
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
      lspconfig.ts_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.gopls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.clangd.setup({})
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
        filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' }
      })
      -- lspconfig.golines.setup({})
      -- lspconfig.gofumpt.setup({})

      -- Define the 'on_list' function to handle references
      local function on_list(options)
        -- Add references to quickfix list and open it
        vim.fn.setqflist({}, ' ', options)
        vim.api.nvim_command('copen')
        -- Map <CR> (Enter) in quickfix window to first jump and then close the window
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<CR>:cclose<CR>', { noremap = true, silent = true })
      end

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {})

      vim.keymap.set('n', '<C-l>', function()
        vim.lsp.buf.references(nil, { on_list = on_list })
      end, { noremap = true, silent = true })
    end
  }
}
