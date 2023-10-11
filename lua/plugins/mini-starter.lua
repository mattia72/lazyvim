return
  {
    "echasnovski/mini.starter",
    enabled = true,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VimEnter",
    opts = function()
      local start_utils = require("start-utils")
      local logo = table.concat(start_utils.logo, "\n")
      local maxlen = start_utils.logo_length()
      local pad_count =  math.floor(maxlen/2)
      local mini_menu_max = 18 + 2 --bullet
      local pad = string.rep(" ", pad_count-(mini_menu_max/2))
      --local pad = string.rep(" ", 30)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Load Last Possession", "PossessionLoad "..start_utils.last_session, "Session"),
          new_section("Saved Possessions... ",     "Telescope possession list",                 "Session"),
          -- new_section("Saved Sessions ( nvim-possession )",    [[lua require("nvim-possession").list()]],   "Session"),
          new_section("Restore Last State", [[lua require("persistence").load()]],       "Session"),
          new_section("Find File ",         "Telescope find_files",                      "Telescope"),
          new_section("Recent Files",       "Telescope oldfiles",                        "Telescope"),
          new_section("Grep Text",          "Telescope live_grep",                       "Telescope"),
          new_section("Edit Config",        "e $MYVIMRC",                                "Config"),
          new_section("Lazy",               "Lazy",                                      "Config"),
          new_section("New File",           "ene | startinsert",                         "Built-in"),
          new_section("Quit",               "qa",                                        "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      local starter = require("mini.starter")
      starter.setup(config)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local maxlen = require("start-utils").logo_length()
          local pad_count =  math.floor(maxlen/2)
          local msg = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count  .. " plugins in " .. ms .. "ms"
          local pad_footer = string.rep(" ", pad_count - (#msg/2))
          starter.config.footer = pad_footer .. msg
          pcall(starter.refresh)

          -- local m = require("mapper")
          -- m.nmap("j", "Down", { desc = "Go down", buffer=0})
          -- m.nmap("k", "Up", { desc = "Go up", buffer=0})
        end,
      })

    end,
}

