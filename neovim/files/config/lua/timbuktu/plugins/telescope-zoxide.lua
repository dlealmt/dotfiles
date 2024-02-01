  return {
    "jvgrootveld/telescope-zoxide",
    config = function ()
      require("telescope").load_extension("zoxide")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nanotee/zoxide.vim" },
  }
