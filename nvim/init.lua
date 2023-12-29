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

  -- IDE
  use { 'neoclide/coc.nvim', branch = 'release' }
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
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>u', builtin.oldfiles, {})

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
