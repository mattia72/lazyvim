local _M = {}

function _M.get_last_session()
  local status, pconfig = pcall(require, "possession.config")
  local file = ""
  if not status then
    --    vim.cmd([[packadd possession.nvim]])
    status, pconfig = pcall(require, "possession.config")
  end
  local path_exists = require("plenary.path").new(pconfig.session_dir):is_dir()
  local utils = require("utils")
  file = path_exists and utils.get_last_modified_in_dir(pconfig.session_dir, "*.json") or ""
  --vim.api.nvim_echo({{'call possession: '.. (status and file or 'failed'), 'None'}}, true, {})
  return status, string.gsub(file, ".json", "")
end

local version = vim.version()
local status, last_session = _M.get_last_session()

_M.last_session = (status and last_session or "")

_M.logo = {
  "                                                                                                     ",
  "     ░▓▓▓            ▓▓▓                                                                             ",
  "   ▒▓▓▓▓▓▓▒          ░▓▓▓▓                                                                           ",
  " ▒▓▓▓▓▓▓░░░░         ▓▓▓▓▓▓▒                                             ▓▓▓▓                        ",
  " ▓▓▓▓▓▓▓▓▒▒▒▒        ▓▓▓▓▓▓▓                                                                         ",
  " ▓▓▓▓▓▓▓▓▓▓▓▓▓▒      ░▓▓▓▓▓▓       ▒▒▓▒         ▒▓▓▒▒    ▓▓▓▓       ▒▓▓▓ ▓▓▓▓  ▓▓▓ ░▓▓▓▓▒  ░▓▓▓▓▓▓   ",
  " ░░░░░▒▓▓▓▓▓▓▓▓▓     ░▓▓▓▓▓▓    ▓▓      ░▓   ░▓▓     ░▓▓  ▓▓▓▓     ▓▓▓▓  ▓▓▓▓  ▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒ ",
  " ▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒    ░▓▓▓▓▓▓   ▓░        ▓░ ▓▓         ▓▓  ▓▓▓▓    ▓▓▓░  ▓▓▓▓  ▓▓▓▓    ░▓▓▓▒    ▒▓▓▓ ",
  " ░░░░░░░ ▒▒▒▒▒▒▒▒▒▒  ░▓▓▓▓▓▓  ░▓▓▓▓▓▓▓▓▓▓▓▓ ▓▒          ▓▓  ▓▓▓   ▓▓▓▓   ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓ ",
  " ░░░░░░░   ▒▒▒▒▒▒▒▒▒ ░▓▓▓▓▓▓  ░▓            ▓▓          ▓▓  ▓▓▓▓ ▒▓▓▓    ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓ ",
  " ░░░░░░░    ▒▒▒▒▒▒▒▒▒░▓▓▓▓▓▓   ▓░           ▓▓         ▓▓    ▒▓▓▒▓▓▓     ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓ ",
  " ░░░░░░░     ▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓    ▓▓       ▓▒  ▒▓       ▓▓░     ▓▓▓▓▓      ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓ ",
  " ░░░░░░░       ░░░░░░▓▓▓▓▓▓▓      ▒▓▓▓▓▓▒      ░▒▓▓▓▓▒         ▒▒▒░      ▓▓▓▓  ▓▓▓▒     ▓▓▓▒    ▓▓▓▓ ",
  " ░░░░░░░        ▓▒▒▒▒▓▓▓▓▓▓▓                                                                         ",
  "  ░░░░░░         ▓▓▓▓▓▓▓▓▓▓                                                                          ",
  "    ░░░░           ▓▓▓▓▓▓▓     " .. " " .. (version and version).major .. "." .. ( version and version).minor .. "-" .. (version and version).patch,
  "      ░▒            ░▓▓▓                                                                              ",
  -- "██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
  -- "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z",
  -- "██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z",
  -- "██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z",
  -- "███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
  -- "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
  -- "  " .. (version and version).major .. "." .. ( version and version).minor .. "-" .. (version and version).patch,
  --"███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  --"████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  --"██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  --"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  --"██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  --"╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  --"  " .. (version and version).major .. "." .. ( version and version).minor .. "-" .. (version and version).patch,
}

function _M.logo_length()
  local maxlen = 0
  for i=1, #_M.logo do
    maxlen = math.max(maxlen, string.len(_M.logo[i]))
  end
  return maxlen/2 --unicode double
end

return _M
