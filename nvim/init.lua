vim.cmd [[packadd packer.nvim]]

-- ----------------------------------------------------------------------------
-- プラグインの管理
-- ----------------------------------------------------------------------------
require("packer").startup(function()
  -- UI
  use 'vim-airline/vim-airline'
  use 'tanvirtin/monokai.nvim'

  -- Utilities
  use 'numToStr/Comment.nvim'

  -- Fussy Finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- IDE
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Lexima
  use { 'cohama/lexima.vim' }

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
 
  -- autotag
  use { 'windwp/nvim-ts-autotag' }
end)

-- ----------------------------------------------------------------------------
-- 基本設定
-- ----------------------------------------------------------------------------
-- Colorscheme
require('monokai').setup { palette = require('monokai').ristretto }

-- <Space> to <Leader>
vim.g.mapleader = ' '

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Whitespace
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ts = 2
vim.opt.sw = 2

-- Row Number
vim.opt.number = true

-- ----------------------------------------------------------------------------
-- コメント
-- ----------------------------------------------------------------------------
require('Comment').setup()

-- ----------------------------------------------------------------------------
-- バッファ操作
-- ----------------------------------------------------------------------------
vim.keymap.set('n', '<C-n>', ':bnext<CR>')
vim.keymap.set('n', '<C-p>', ':bprev<CR>')

-- ----------------------------------------------------------------------------
-- Telescope
-- ----------------------------------------------------------------------------
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>u', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>u', builtin.oldfiles, {})
vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

-- ----------------------------------------------------------------------------
-- Coc
-- ----------------------------------------------------------------------------
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gu', '<Plug>(coc-references)')
vim.keymap.set('n', 'gr', '<Plug>(coc-rename)')
vim.keymap.set('n', 'gf', '<Plug>(coc-format)')

-- Coc Snippets
vim.g.coc_snippets_next = '<c-j>'
vim.g.coc_snippets_prev = '<c-k>'
vim.keymap.set('i', '<C-k>', '<Plug>(coc-snippets-expand-jump)')

-- ----------------------------------------------------------------------------
-- Tree Sitter
-- ----------------------------------------------------------------------------
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
