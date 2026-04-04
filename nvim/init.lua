-- --- Plugin Manager (Lazy.nvim) -----------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- --- General Settings ---------------------------------------------------------
vim.g.mapleader = " "         -- Leader key (Space)

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative numbers for fast jumping
vim.opt.termguicolors = true  -- 24-bit RGB colors
vim.opt.cursorline = true     -- Highlight current line
vim.opt.clipboard = "unnamedplus" -- System clipboard sync

-- Tabs & Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true

-- --- Plugins Setup -----------------------------------------------------------
require("lazy").setup({
    -- Theme & Icons
    { "oxfist/night-owl.nvim", lazy = false, priority = 1000 },
    { "nvim-tree/nvim-web-devicons" },

    -- Statusline & UI
    { 
        "nvim-lualine/lualine.nvim", 
        dependencies = { "nvim-tree/nvim-web-devicons" } 
    },

    -- File Explorer
    { 
        "nvim-tree/nvim-tree.lua", 
        dependencies = { "nvim-tree/nvim-web-devicons" } 
    },

    -- Syntax & LSP
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
})

-- --- Theme Configuration -----------------------------------------------------
vim.cmd.colorscheme("night-owl")

-- Lualine
require('lualine').setup({
    options = {
        theme = 'night-owl',
        component_separators = '|',
        section_separators = '',
    }
})

-- --- Keybindings & Tools -----------------------------------------------------

-- NvimTree Toggle (Space + n)
require("nvim-tree").setup({
    view = { width = 30 },
    renderer = { group_empty = true }
})
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { silent = true })

-- Quick Save/Exit
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
