return {
  "nvim-telescope/telescope.nvim",
  enabled = { require("utils").no_vscode },
  keys = function()
    local Util = require("lazyvim.util")
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
      { "<leader>tl", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
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
}
