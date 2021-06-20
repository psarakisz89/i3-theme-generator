-- load all plugins
require "pluginList"
require "file-icons"

require "misc-utils"
require "top-bufferline"
require "statusline"

require("colorizer").setup()

-- lsp stuff
require "nvim-lspconfig"
require "compe-completion"
require('nvim_comment').setup({create_mappings = false}) --comment toggle

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 0

-- colorscheme related stuff
-- Uncomment the lines below for traditional Color theme
-- cmd "syntax on"
-- cmd "set termguicolors"
-- cmd "colorscheme badwolf"

-- New Lua based themer
local base16 = require "base16"
base16(base16.themes["seti"], true)
-- base16(base16.themes["woodland"], true)
-- print(vim.inspect(base16.theme_names()))

-- local theme_names = base16.theme_names()
-- base16_position = 1
-- function cycle_theme()
  -- base16_position = (base16_position % #theme_names) + 1
  -- base16(base16.themes[theme_names[base16_position]], true)
  -- print(theme_names[base16_position])
-- end

require "custom_highlights"

-- blankline

local indent = 2

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

require "treesitter-nvim"
require "mappings"
require "nvimTree"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)

-- FZF Related
-- cmd "let g:fzf_colors = { 'fg': ['fg', 'Normal'],'bg': ['bg', 'Normal'], 'hl':  ['fg', 'Comment'], 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],'bg+':  ['bg', 'CursorLine', 'CursorColumn'], 'hl+': ['fg', 'Statement'], 'info': ['fg', 'PreProc'], 'border': ['fg', 'Ignore'], 'prompt': ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker':  ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header':  ['fg', 'Comment'] }"
-- cmd "let g:fzf_preview_window = ['up:35%', 'ctrl-/']"

--Telescope
require "telescope-nvim"

-- git
cmd "let g:blamer_enabled = 1"
cmd "let g:blamer_show_in_insert_modes = 0"

-- Save/Restore Sessions
local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('config').."/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil
}
require('auto-session').setup(opts)
