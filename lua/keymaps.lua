-- General Editor Keymaps go HERE

local opt = vim.opt
local cmd = vim.cmd

local function noremap(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nnoremap(shortcut, command)
	noremap('n', shortcut, command)	
end

local function inoremap(shortcut, command)
	noremap('i', shortcut, command)
end

local function vnoremap(shortcut, command)
	noremap('v', shortcut, command)
end

local autocmd = vim.api.nvim_create_autocmd

-- Set the leader key to space
vim.g.mapleader = " "


-- ========== Basic Mappings ========== --
nnoremap("Q", "<cmd>q<CR>")
nnoremap("S", "<cmd>w<CR>")
nnoremap("<LEADER>rc", "<cmd>e $HOME/.config/nvim/init.lua<CR>")
nnoremap("<LEADER>rv", "<cmd>e .nvimrc<CR>")
nnoremap("<esc>", "<cmd>noh<CR>")


-- ========== Moving Cursor ==========
nnoremap("J", "10j")
nnoremap("K", "10k")


-- ========== Window Management ==========
-- Focus on different panels
nnoremap("<LEADER>h", "<C-w>h")
nnoremap("<LEADER>j", "<C-w>j")
nnoremap("<LEADER>k", "<C-w>k")
nnoremap("<LEADER>l", "<C-w>l")

-- Window split
nnoremap("sk", "<cmd>set nosplitbelow<CR><cmd>split<CR><cmd>set splitbelow<CR>")
nnoremap("sj", "<cmd>set splitbelow<CR><cmd>split<CR>")
nnoremap("sh", "<cmd>set nosplitright<CR><cmd>vsplit<CR><cmd>set splitright<CR>")
nnoremap("sl", "<cmd>set splitright<CR><cmd>vsplit<CR>")

-- Reszie with arrow keys
nnoremap("<up>", "<cmd>res +5<CR>")
nnoremap("<down>", "<cmd>res -5<CR>")
nnoremap("<left>", "<cmd>vertical resize+5<CR>")
nnoremap("<right>", "<cmd>vertical resize-5<CR>")

-- Place the panels
nnoremap("sc", "<C-w>t<C-w>K") -- Place the two panels up and down
nnoremap("sv", "<C-w>t<C-w>H") -- Place the two panels left and right
nnoremap("sr", "<C-w>r") -- Switch the panels


