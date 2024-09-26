-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local current_theme = "gruvbox"
local function get_system_mode()
  local output = vim.fn.system({"defaults", "read", "-g", "AppleInterfaceStyle"})
  if string.match(output, "Dark") then
    return "dark"
  else
    return "light"
  end
end
local mode = get_system_mode()
if (mode == "dark") then
  vim.api.nvim_set_option("background", "dark")
else
  vim.api.nvim_set_option("background", "light")
end
local function _3_()
  do
    local rp = require("rose-pine")
    rp.setup({["disable-background"] = true})
  end
  return vim.cmd("colorscheme rose-pine")
end
local function _4_()
  do
    local gruvbox = require("gruvbox")
    gruvbox.setup({terminal_colors = true, undercurl = true, underline = true, italic = {strings = true, emphasis = true, comments = true, folds = true, operators = false}, strikethrough = true, inverse = true, contrast = "hard", palette_overrides = {}, overrides = {}, bold = false, dim_inactive = false, invert_intend_guides = false, invert_selection = false, invert_signs = false, invert_tabline = false, transparent_mode = false})
  end
  return vim.cmd("colorscheme gruvbox")
end
local function _5_()
  do
    local onedark = require("onedark")
    local _6_
    if (mode == "dark") then
      _6_ = "darker"
    else
      _6_ = "light"
    end
    onedark.setup({style = _6_})
  end
  return vim.cmd("colorscheme onedark")
end
local function _8_()
  do
    local cd = require("cyberdream")
    cd.setup({transparent = true})
  end
  return vim.cmd("colorscheme cyberdream")
end
local function _9_()
  vim.g.everforest_transparent_background = 1
  return vim.cmd("colorscheme everforest")
end
local function _10_()
  do
    local kan = require("kanagawa")
    kan.setup({transparent = false})
  end
  return vim.cmd("colorscheme kanagawa")
end
return {{"rose-pine/neovim", priority = 1000, cond = (current_theme == "rose"), config = _3_}, {"ellisonleao/gruvbox.nvim", priority = 1000, cond = (current_theme == "gruvbox"), config = _4_}, {"navarasu/onedark.nvim", priority = 1000, cond = (current_theme == "onedark"), config = _5_}, {"scottmckendry/cyberdream.nvim", priority = 1000, cond = (current_theme == "cyberdream"), config = _8_}, {"sainnhe/everforest", priority = 1000, cond = (current_theme == "everforest"), config = _9_}, {"rebelot/kanagawa.nvim", priority = 1000, cond = (current_theme == "kanagawa"), config = _10_}}
