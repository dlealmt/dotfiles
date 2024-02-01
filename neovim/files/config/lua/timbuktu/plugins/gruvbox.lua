  return {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        constrast = "hard",
        transparent_mode = true,
      })

      vim.cmd.colorscheme("gruvbox")
    end
  }
