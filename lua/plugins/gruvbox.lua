return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,    -- Load immediately
  priority = 1000, -- Load Gruvbox before other plugins
  config = function()
    require("gruvbox").setup({
      contrast = "soft",           -- Options: 'hard', 'medium', 'soft'
      transparent_mode = true,     -- Set to true if you want a transparent background
    })
    vim.cmd("colorscheme gruvbox") -- Apply the Gruvbox colorscheme
  end,
}
