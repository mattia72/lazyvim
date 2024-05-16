-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- add colorschemes
  { "ellisonleao/gruvbox.nvim", lazy=true},
  { "catppuccin/nvim", lazy=true},

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato", --"gruvbox", --"habamax", --"catppuccin"
    },
  },
  {
    "folke/lazy.nvim",
    keys = { { "<leader>l", false } }, --disable keymap couses error
  },
  {
    "folke/which-key.nvim",
    vscode = true,
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
      { "<leader>snl", false },
      { "<leader>snh", false },
      { "<leader>sna", false },
      { "<leader>snd", false },

      --
      { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",    desc = "Redirect Cmdline" },
      { "<leader>sNl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
      { "<leader>sNh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
      { "<leader>sNa", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
      { "<leader>sNd", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
      { "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true, expr = true, desc = "Scroll forward",  mode = {"i", "n", "s"} },
      { "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
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
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_y = {
          { "filetype", separator = '', padding = { left = 1, right = 1 } },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        }
      }
    }
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
    -- dir=require('utils').joinpath(os.getenv('HOME'), '/dev/vim/vim-delphi') ,
    dir='c:/home/mata/dev/vim/vim-delphi',
    ft='delphi' --Lazy Load on filetype delphi
  },
  {
    'andymass/vim-matchup',
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_surround_enabled = 1
    end,
  },
  { 'echasnovski/mini.align',
    vscode=true,
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "junegunn/vim-easy-align",
    enabled=false,
    vscode=true,
    version=false,
    config = function()
      local mapper = require("mapper")
      mapper.xmap("ga", "<Plug>(EasyAlign)", { desc = "Align selected at ..." })
      mapper.nmap("ga", "<Plug>(EasyAlign)", { desc = "Align line at ..." })
    end,
  },
}
