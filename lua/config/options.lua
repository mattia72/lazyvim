-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

if vim.fn.executable("rg") then
  vim.cmd("set isfname&") -- vim.opt.isfname to the default
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
else
  vim.opt.grepprg = "internal"
end

vim.opt.guifont = "UbuntuMono NF:h12:cEASTEUROPE"
