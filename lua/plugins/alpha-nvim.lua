--
-- lua config file for alpha
--

local utils = require("utils")
local function get_last_session()
  local status, pconfig = pcall(require, "possession.config")
  local file = ""
  if not status then
    --    vim.cmd([[packadd possession.nvim]])
    status, pconfig = pcall(require, "possession.config")
  end
  local path_exists = require("plenary.path").new(pconfig.session_dir):is_dir()
  file = path_exists and utils.get_last_modified_in_dir(pconfig.session_dir, "*.json") or ""
  --vim.api.nvim_echo({{'call possession: '.. (status and file or 'failed'), 'None'}}, true, {})
  return status, string.gsub(file, ".json", "")
end

return {
  "goolord/alpha-nvim",
  enabled = { utils.no_vscode },
  opts = function()
    local version = vim.version()
    local status, last_session = get_last_session()
    last_session = (status and last_session or "")
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
      dashboard.button("r", " " .. " Reload Last Saved Session", ":PossessionLoad " .. last_session .. "<CR>"),
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
}

--"███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
--"████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
--"██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
--"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
--"██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
--"╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
