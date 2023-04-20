-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "habamax",
    },
  },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },
  {
    "folke/lazy.nvim",
    keys = { "<leader>l", false }, --disable keymap
    opts = {
      ui = {
        icons = {
          cmd = " ",
          config = " ",
          event = " ",
          ft = " ",
          init = " ",
          import = " ",
          keys = " ",
          lazy = "鈴 ",
          loaded = "●",
          not_loaded = "○",
          plugin = " ",
          runtime = " ",
          source = " ",
          start = " ",
          task = "✔  ",
          list = {
            "●",
            "➜",
            "★",
            "‒",
          },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = { require("utils").no_vscode },
    opts = {
      options = {
        mode = "tabs",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
      },
    },
  },
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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ignore_install = { "help" },
    },
  },
  {
    "neovim/nvim-lspconfig",
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
    "junegunn/vim-easy-align",
    config = function()
      local mapper = require("mapper")
      mapper.xmap("ga", "<Plug>(EasyAlign)", { desc = "Align selected at ..." })
      mapper.nmap("ga", "<Plug>(EasyAlign)", { desc = "Align line at ..." })
    end,
  },
}
