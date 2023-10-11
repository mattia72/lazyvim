return {
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = true,
    enabled = false,
    init =function ()
      local m = require('mapper')
      m.nmap( "<leader>snl", function() require("nvim-possession").list() end,   { desc = "Possession list sessions "})
      m.nmap( "<leader>snh", function() require("nvim-possession").new() end,    { desc = "Possession new session" })
      m.nmap( "<leader>sna", function() require("nvim-possession").update() end, { desc = "Possession update session" })
      m.nmap( "<leader>snd", function() require("nvim-possession").delete() end, { desc = "Possession delete session" })
    end,
    keys = {
    },
  },
  {
    "jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("possession").setup({
        session_dir = vim.fn.stdpath("data") .. "\\possession",
        autosave = {
          current = true, -- or fun(name): boolean
          tmp = false, -- or fun(): boolean
          tmp_name = "tmp_possession",
          on_load = true,
          on_quit = true,
        },
        hooks = {
          before_save = function(_) return {} end,
          after_save = function(name, user_data, aborted)
            require("utils").notify_info("Possession", "Session " .. name .. " saved.")
          end,
          before_load = function(name, user_data) return user_data end,
          after_load = function(name, user_data) end,
        },
        plugins = {
          close_windows = {
            hooks = { "before_save", "before_load" },
            preserve_layout = true, -- or fun(win): boolean
            match = {
              floating = true,
              buftype = {},
              filetype = { "qf", "packer" },
              custom = false, -- or fun(win): boolean
            },
          },
          delete_hidden_buffers = {
            hooks = {
              --'before_load',
              --vim.o.sessionoptions:match('buffer') and 'before_save',
            },
            force = false, -- or fun(buf): boolean
          },
          delete_buffers = false,
        },
      })
      -- add possession to telescope
      vim.keymap.set("n", "<leader>ts", function()
        require("telescope").extensions.possession.list()
      end, { desc = "List sessions" })
    end,
  },
}
