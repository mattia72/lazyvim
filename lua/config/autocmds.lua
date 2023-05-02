-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- function Set_cursorcolumn_cursorline()
--   vim.opt.cursorcolumn = true
--   vim.opt.cursorline = false --Highlight only the screen column of the cursor
-- end

-- vim.api.nvim_create_autocmd({ "UIEnter" }, {
--   -- pattern = { "lua" },
--   callback = function()
--     vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--       callback = function()
--       Set_cursorcolumn_cursorline()
--       end,
--     })
--   end,
-- })
