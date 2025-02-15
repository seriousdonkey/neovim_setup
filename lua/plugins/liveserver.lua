return {
  "barrett-ruth/live-server.nvim",
  config = function()
    require("live-server").setup({
      port = 8080,                 -- Set the port for the live server
      browser_command = "firefox", -- Command to open the browser (use your preferred browser)
      quiet = false,               -- Set to true to suppress output from the plugin
      no_css_inject = false,       -- Set to true to disable automatic CSS injection
    })
  end,
  cmd = { "LiveServerStart", "LiveServerStop" }, -- Add commands for Lazy loading
}
