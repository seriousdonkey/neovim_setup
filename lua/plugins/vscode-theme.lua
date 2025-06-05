return {
  {
    "Mofiqul/vscode.nvim",
    name = "vscode-theme",
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
      })

      vim.cmd.colorscheme("vscode")
    end,
  },
}
