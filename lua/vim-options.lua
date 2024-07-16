vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "

vim.api.nvim_exec([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePre *.tsx,*.ts Neoformat
  augroup END
]], false)
