return {
    'folke/tokyonight.nvim',
    lazy = false,  -- Load it immediately on startup
    priority = 1000,  -- Make sure it loads first
    config = function()
      -- Configuration options
      require('tokyonight').setup({
        style = 'storm',  -- You can set 'night', 'storm', 'moon', or 'day' depending on your preference
        transparent = false,  -- Enable/Disable transparent background
        terminal_colors = true,  -- Apply colors to Neovim terminal
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
          sidebars = "dark",  -- Style for sidebars like NvimTree
          floats = "dark",  -- Style for floating windows
        },
        -- Customize colors
        on_colors = function(colors)
          -- You can override any color like this
          colors.hint = "#ff9900"
          colors.error = "#ff0000"
        end,
      })

      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
