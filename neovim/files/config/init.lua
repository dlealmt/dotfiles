vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.guifont = "Iosevka Timbuktu:h12"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.title = true
vim.opt.titlestring = "   %t"
vim.opt.undofile = true
vim.opt.virtualedit = "block"

vim.wo.number = true
vim.wo.signcolumn = "yes"

vim.g.mapleader = " "

local function keymap_set(lhs, rhs, desc, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", { silent = true, noremap = true, desc = desc }, opts)

  vim.keymap.set("n", lhs, rhs, opts)
end

keymap_set("Q", "ZQ",  "Quit")
keymap_set("<D-C-h>", "[b", "Previous buffer")
keymap_set("<D-C-l>", "]b", "Next buffer")
keymap_set("<D-h>", "<C-w>h", "Window to the left")
keymap_set("<D-l>", "<C-w>l", "Window to the right")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("timbuktu")
