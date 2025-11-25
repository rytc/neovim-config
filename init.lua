-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.ignorecase = true
vim.o.smartcase =  true

vim.o.signcolumn = 'yes'

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.scrolloff = 10
vim.o.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.cmd [[set nowrap]]
vim.cmd [[set expandtab]]
vim.cmd [[colorscheme  NeoSolarized]]

-- Setup lazy.nvim
require("lazy").setup({
  'rytc/jai.vim',
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    keys = {
      { "<Leader>tt", "<cmd>ToggleTerm<cr>", desc = "Open a horizontal terminal at the Desktop directory" }
    },
    opts = {
      shade_terminals = true,
      direction = "float"
    }
  },
  {
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep'
    }
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<Leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = "solarized_dark",
        icons_enabled = false
      }
    }
  }

})

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>b', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>g',  telescope.live_grep, { desc = 'Telescope grep' })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<cr>")

