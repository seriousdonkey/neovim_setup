return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,   -- Ensure the theme loads during startup
  priority = 999, -- Ensure it loads before other start plugins
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- You can choose between "latte", "frappe", "macchiato", "mocha"
      background = {         -- Override the background color if needed
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- Enable/Disable transparent background
      term_colors = true,             -- Use terminal colors
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        -- Add more integrations based on what you need
      },
    })
    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
}
