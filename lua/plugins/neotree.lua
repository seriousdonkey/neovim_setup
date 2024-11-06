return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
    -- vim.api.nvim_create_autocmd("BufRead", { -- Changed from BufReadPre
    --   desc = "Open neo-tree on enter",
    --   group = "neotree_autoopen",
    --   once = true,
    --   callback = function()
    --     if not vim.g.neotree_opened then
    --       vim.cmd "Neotree show"
    --       vim.g.neotree_opened = true
    --     end
    --   end,
    -- })
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,                       -- Automatically sync tree with current file
        },
        hijack_netrw_behavior = "open_default", -- Optional: Disable netrw
        use_libuv_file_watcher = true,          -- Watch for changes in the file system
      },
    })
  end
}
