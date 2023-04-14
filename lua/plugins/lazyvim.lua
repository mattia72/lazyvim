-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
local utils = require("utils")
local Util = require("lazyvim.util")

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "folke/lazy.nvim",
    keys = { "<leader>l", false },
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
    enabled = { utils.no_vscode },
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
    "nvim-telescope/telescope.nvim",
    enabled = { utils.no_vscode },
    keys = function()
      return {
        { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
        { "<leader>/", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
        { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
        -- find
        { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>tf", Util.telescope("files"), desc = "Find Files (root dir)" },
        { "<leader>tF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
        { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>tm", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        { "<leader>ts", "<cmd>Telescope possession list<cr>", "Telescope possession list" },
        -- git
        --{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        --{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
        -- search
        { "<leader>ta", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader>tC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
        { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
        { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
        { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
        {
          "<leader>ss",
          Util.telescope("lsp_document_symbols", {
            symbols = {
              "Class",
              "Function",
              "Method",
              "Constructor",
              "Interface",
              "Module",
              "Struct",
              "Trait",
              "Field",
              "Property",
            },
          }),
          desc = "Goto Symbol",
        },
        {
          "<leader>sS",
          Util.telescope("lsp_workspace_symbols", {
            symbols = {
              "Class",
              "Function",
              "Method",
              "Constructor",
              "Interface",
              "Module",
              "Struct",
              "Trait",
              "Field",
              "Property",
            },
          }),
          desc = "Goto Symbol (Workspace)",
        },
      }
    end,
    mappings = {
      n = {
        ["<c-h>"] = "which_key",
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      }, -- n
      i = {
        ["<c-h>"] = "which_key",
        ["<c-d>"] = require("telescope.actions").delete_buffer,
      }, -- i
    }, -- mappings
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
  -- add telescope-possession
  {
    "jedrzejboczar/possession.nvim",
    enabled = { utils.no_vscode },
    config = function()
      vim.keymap.set("n", "<leader>ts", function()
        require("telescope").extensions.possession.list()
      end, { desc = "List sessions" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ignore_install = { "help" },
    },
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
  {
    "jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config/possession")
    end,
    enabled = { utils.no_vscode },
  },
}
