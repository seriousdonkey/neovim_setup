return {
  "Mofiqul/dracula.nvim",
  config = function()
    -- Load the Dracula theme with custom options
    require("dracula").setup({
      -- You can customize options here. These are just some defaults.
      show_end_of_buffer = true, -- Show '~' at the end of buffers
      transparent_bg = true,     -- Use a transparent background
      italic_comment = true,     -- Enable italic comments
    })

    -- Apply the theme
    vim.cmd.colorscheme("dracula")
  end,
  priority = 1000, -- High priority to load this theme first
}
