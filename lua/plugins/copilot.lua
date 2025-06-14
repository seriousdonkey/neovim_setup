return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    dependencies = { 'windwp/nvim-autopairs' },
    event = "InsertEnter",
    config = function()
      local copilot = require 'copilot'
      local suggestion = require 'copilot.suggestion'
      local autopairs = require 'nvim-autopairs'

      copilot.setup {
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          ['*'] = true,
        },
      }

      vim.keymap.set('i', '<C-u>', function()
        autopairs.disable()
        suggestion.accept()
        autopairs.enable()
      end, { desc = 'Accept Copilot suggestion' })
      vim.keymap.set('i', '<C-U>', function()
        suggestion.accept()
      end, { desc = 'Accept Copilot suggestion' })
    end,
  },
}
