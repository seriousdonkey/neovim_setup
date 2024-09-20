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
    opts = {
      inlay_hints = { enabled = true }
    },
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
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

      vim.keymap.set('n', '<C-l>', function() 
        vim.lsp.buf.references(nil, { on_list = on_list })
      end, { noremap = true, silent = true })

    end
  }
}
