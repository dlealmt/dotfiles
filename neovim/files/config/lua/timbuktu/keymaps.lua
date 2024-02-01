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
