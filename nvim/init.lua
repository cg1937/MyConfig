local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins')

-- Vim mappings, see lua/config/which.lua for more mappings
require('mappings')

-- All non plugin related (vim) options
require('options')

-- Vim autocommands/autogroups
require('autocmds')

-- Set favorite colorschemes
vim.cmd('colorscheme github_light')

if vim.g.neovide then
	vim.o.guifont = 'CaskaydiaCove Nerd Font Mono:h14'
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_vfx_mode = 'railgun'
	vim.g.neovide_cursor_vfx_particle_phase = 1.2
	vim.g.neovide_cussor_vfx_particle_curl = 0.8
end
