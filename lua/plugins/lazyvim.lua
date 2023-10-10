-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "catppuccin/nvim",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato", --"gruvbox", --"habamax", --"catppuccin"
    },
  },
  {
    "folke/lazy.nvim",
    -- cond = no_vscode,
    keys = { { "<leader>l", false } }, --disable keymap couses error
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("noice.nvim") then
        opts.defaults["<leader>sn"] = nil
        opts.defaults["<leader>sN"] = { name = "+noice" }
      end
    end,
  },
  {
    "folke/noice.nvim",
    keys = {
      -- stylelua: ignore
      { "<leader>snl", false},
      { "<leader>snh", false},
      { "<leader>sna", false},
      { "<leader>snd", false},
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>sNl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>sNh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sNa", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>sNd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
      },
    },
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
  --  { dir = "~/dev/vim/vim-ripgrep" },
  {
    "junegunn/vim-easy-align",
    config = function()
      local mapper = require("mapper")
      mapper.xmap("ga", "<Plug>(EasyAlign)", { desc = "Align selected at ..." })
      mapper.nmap("ga", "<Plug>(EasyAlign)", { desc = "Align line at ..." })
    end,
  },
}
