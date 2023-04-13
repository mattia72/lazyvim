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
        { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        { "<leader>ts", "<cmd>Telescope possession list<cr>", "Telescope possession list" },
        -- git
        --{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        --{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
        -- search
        { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
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
  {
    "goolord/alpha-nvim",
    enabled = { utils.no_vscode },
    opts = function()
      local version = vim.version()
      local dashboard = require("alpha.themes.dashboard")
      local logo = {
        "                                                                                                          ",
        "     ░▓▓▓            ▓▓▓                                                                                  ",
        "   ▒▓▓▓▓▓▓▒          ░▓▓▓▓                                                                                ",
        " ▒▓▓▓▓▓▓░░░░         ▓▓▓▓▓▓▒                                             ▓▓▓▓                             ",
        " ▓▓▓▓▓▓▓▓▒▒▒▒        ▓▓▓▓▓▓▓                                                                              ",
        " ▓▓▓▓▓▓▓▓▓▓▓▓▓▒      ░▓▓▓▓▓▓       ▒▒▓▒         ▒▓▓▒▒    ▓▓▓▓       ▒▓▓▓ ▓▓▓▓  ▓▓▓ ░▓▓▓▓▒  ░▓▓▓▓▓▓        ",
        " ░░░░░▒▓▓▓▓▓▓▓▓▓     ░▓▓▓▓▓▓    ▓▓      ░▓   ░▓▓     ░▓▓  ▓▓▓▓     ▓▓▓▓  ▓▓▓▓  ▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒      ",
        " ▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒    ░▓▓▓▓▓▓   ▓░        ▓░ ▓▓         ▓▓  ▓▓▓▓    ▓▓▓░  ▓▓▓▓  ▓▓▓▓    ░▓▓▓▒    ▒▓▓▓      ",
        " ░░░░░░░ ▒▒▒▒▒▒▒▒▒▒  ░▓▓▓▓▓▓  ░▓▓▓▓▓▓▓▓▓▓▓▓ ▓▒          ▓▓  ▓▓▓   ▓▓▓▓   ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓      ",
        " ░░░░░░░   ▒▒▒▒▒▒▒▒▒ ░▓▓▓▓▓▓  ░▓            ▓▓          ▓▓  ▓▓▓▓ ▒▓▓▓    ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓      ",
        " ░░░░░░░    ▒▒▒▒▒▒▒▒▒░▓▓▓▓▓▓   ▓░           ▓▓         ▓▓    ▒▓▓▒▓▓▓     ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓      ",
        " ░░░░░░░     ▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓    ▓▓       ▓▒  ▒▓       ▓▓░     ▓▓▓▓▓      ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓      ",
        " ░░░░░░░       ░░░░░░▓▓▓▓▓▓▓      ▒▓▓▓▓▓▒      ░▒▓▓▓▓▒         ▒▒▒░      ▓▓▓▓  ▓▓▓▒     ▓▓▓▒    ▓▓▓▓      ",
        " ░░░░░░░        ▓▒▒▒▒▓▓▓▓▓▓▓                                                                              ",
        "  ░░░░░░         ▓▓▓▓▓▓▓▓▓▓                                                                               ",
        "    ░░░░           ▓▓▓▓▓▓▓     " .. " " .. (version and version).major .. "." .. (
          version and version
        ).minor .. "-" .. (version and version).patch,
        "      ░▒            ░▓▓▓                                                                                  ",
      }

      dashboard.section.header.val = logo
      dashboard.section.buttons.val = {
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("d", " " .. " Delphi", ":so ~/delphi-dev.vim | PossessionLoad delphi-dev<CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("o", " " .. " Open Session", ":Telescope possession list<CR>"),
        dashboard.button("s", " " .. " Restore Last Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "Keyword"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Comment" --"AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
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
  {
    "jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config/possession")
    end,
    enabled = { utils.no_vscode },
  },
}
