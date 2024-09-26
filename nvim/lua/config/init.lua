-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local map
local function _3_(modes, lhs, rhs, ...)
  local _arg_2_ = {...}
  local opts = _arg_2_[1]
  return vim.keymap.set(modes, lhs, rhs, (opts or {}))
end
map = _3_
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, nu = true, relativenumber = true, undodir = (os.getenv("HOME") .. "/.vim/undodir"), undofile = true, incsearch = true, scrolloff = 8, updatetime = 50, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, signcolumn = "number", backup = false, hlsearch = false, swapfile = false, wrap = false}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
vim.opt.isfname:append("@-@")
map("n", "<leader>nn", vim.cmd.Ex)
local normal_visual_modes = {n = "v"}
local key_mappings = {n = "h", e = "j", i = "k", o = "l", ["'"] = "o", k = "n", s = "i", f = "e", S = "I"}
for lhs, rhs in pairs(key_mappings) do
  map("n", lhs, rhs)
end
for lhs, rhs in pairs(key_mappings) do
  map("v", lhs, rhs)
end
vim.api.nvim_create_augroup("CustomNetrwMappings", {clear = true})
local function _4_()
  local netrw_mappings = {n = "h", e = "j", i = "k", o = "l", ["'"] = "o", k = "n", s = "i", f = "e", S = "I"}
  for lhs, rhs in pairs(netrw_mappings) do
    vim.keymap.set("n", lhs, rhs, {buffer = true})
  end
  return nil
end
vim.api.nvim_create_autocmd("FileType", {group = "CustomNetrwMappings", pattern = "netrw", callback = _4_})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>gg", "ggVG")
vim.keymap.set("v", "<leader>gg", "ggVG")
local function _5_()
  local old_pos = vim.fn.getpos(".")
  vim.cmd("normal! ggVG\"+y")
  return vim.fn.setpos(".", old_pos)
end
vim.keymap.set({"n", "v"}, "<leader>yy", _5_, {desc = "Yank entire buffer to system clipboard"})
return {}
