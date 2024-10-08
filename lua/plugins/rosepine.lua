return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,    -- load immediately
    priority = 1002, -- ensure it loads before other plugins
    config = function()
      -- Optional setup configuration for Rose Pine theme
      require('rose-pine').setup({
        dark_variant = 'moon', -- or 'moon' or 'dawn'
        disable_background = false,
        disable_float_background = false,
        disable_italics = true,
      })

      -- Set colorscheme
      vim.cmd('colorscheme rose-pine')
    end
  }
}
