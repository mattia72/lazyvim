--
-- lua config file for alpha
--

local use_mini_starter = true
if use_mini_starter then return {
    { import = "lazyvim.plugins.extras.ui.mini-starter" }
  }
end

return {
  "goolord/alpha-nvim",
  enabled = require("utils").no_vscode(),
  opts = function()
    local start_utils = require('start-utils')
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = start_utils.logo
    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("d", " " .. " Delphi", ":so ~/delphi-dev.vim | PossessionLoad delphi-dev<CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("o", " " .. " Open Session", ":Telescope possession list<CR>"),
      dashboard.button("r", " " .. " Reload Last Saved Session", ":PossessionLoad " .. start_utils.last_session .. "<CR>"),
      dashboard.button("s", " " .. " Restore Last Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", "⏻ " .. " Quit", ":qa<CR>"),
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
}

