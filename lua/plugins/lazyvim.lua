-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

local no_vscode = require("utils").no_vscode
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    enabled = { no_vscode },
    opts = {
      colorscheme = "gruvbox", --"habamax", --"catppuccin"
    },
  },
  {
    import = "lazyvim.plugins.extras.ui.mini-animate" },
    enabled = { no_vscode },
  {
    "folke/lazy.nvim",
    enabled = { no_vscode },
    keys = { "<leader>l", false }, --disable keymap
  },
  {
    "akinsho/bufferline.nvim",
    enabled = { no_vscode },
    opts = {
      options = {
        mode = "tabs",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = { no_vscode },
    opts = {
      ignore_install = { "help" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    enabled = { no_vscode },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<leader>cd", false }
    end,
  },

  --
  -- Own plugins
  --
  {
    "gbprod/yanky.nvim",
    -- enabled = false,
    config = function()
      require("yanky").setup({})
      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
      vim.keymap.set("n", "<leader>ty", function()
        require("telescope").extensions.yank_history.yank_history({})
      end, { desc = "Paste from Yanky" })
    end,
  },
  {
    "junegunn/vim-easy-align",
    config = function()
      local mapper = require("mapper")
      mapper.xmap("ga", "<Plug>(EasyAlign)", { desc = "Align selected at ..." })
      mapper.nmap("ga", "<Plug>(EasyAlign)", { desc = "Align line at ..." })
    end,
  },
}
