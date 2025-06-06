return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" }
    },
    config = function()
      local neotest_golang_opts = {}
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(neotest_golang_opts)
        }
      })

      vim.keymap.set('n', '<leader>nr', "<cmd>lua require('neotest').run.run()<CR>", {})
      vim.keymap.set('n', '<leader>nf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {})
      vim.keymap.set('n', '<leader>na', "<cmd>lua require('neotest').run.run({ suite = true })<CR>", {})
      vim.keymap.set('n', '<leader>no', "<cmd>lua require('neotest').output.open()<CR>", {})
      vim.keymap.set('n', '<leader>np', "<cmd>lua require('neotest').output_panel.toggle()<CR>", {})
    end
  }
}
