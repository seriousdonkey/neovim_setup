return {
  -- LazyVim and other default plugins go here

  -- Add NerdCommenter
  {
    "preservim/nerdcommenter",
    config = function()
      -- Configure NerdCommenter settings here
      vim.g.NERDSpaceDelims = 1            -- Add a space after comment delimiters
      vim.g.NERDDefaultAlign = 'left'      -- Align comments to the left
      vim.g.NERDCommentEmptyLines = 1      -- Allow commenting empty lines
      vim.g.NERDTrimTrailingWhitespace = 1 -- Trim trailing whitespace when commenting

      -- Keybindings (optional, NerdCommenter provides defaults)
      vim.api.nvim_set_keymap('n', '<Leader>cc', '<Plug>NERDCommenterToggle', {})
      vim.api.nvim_set_keymap('v', '<Leader>cc', '<Plug>NERDCommenterToggle', {})
    end,
  },
}
