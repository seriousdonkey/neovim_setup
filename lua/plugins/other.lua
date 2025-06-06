return {
  {
    "rgroli/other.nvim",
    event = "VeryLazy",
    config = function()
      require("other-nvim").setup({
        mappings = {
          "angular"
        },
        transformers = {
          lowercase = function(inputString)
            return inputString:lower()
          end
        },
        style = {
          border = "single",
          seperator = "|",
        }
      })

      vim.keymap.set('n', '<leader>ll', "<cmd>:Other<CR>", {})
    end,
  },
}
