return {
  "navarasu/onedark.nvim",
  name = "onedark",
  priority = 1001,
  config = function()
    require('onedark').setup {
      style = 'cool'
    }
    require('onedark').load()
  end
}

