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
-- カラースキーム
-- ----------------------------------------------------------------------------
require('monokai').setup { palette = require('monokai').ristretto }

-- ----------------------------------------------------------------------------
-- <Leader>
-- ----------------------------------------------------------------------------
vim.g.mapleader = ' '

-- ----------------------------------------------------------------------------
-- クリップボード
-- ----------------------------------------------------------------------------
vim.opt.clipboard = "unnamedplus"

-- ----------------------------------------------------------------------------
-- ホワイトスペース
-- ----------------------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.ts = 2
vim.opt.sw = 2

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

vim.opt.completeopt = 'menuone,noinsert'
