  return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local ts = require("telescope")

      ts.setup({
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
            flex = {
              mirror = true,
            }
          },
          sorting_strategy = "ascending",
        },
      })
    end,
    keys = {
      { "<c-/>", "<cmd>Telescope lines<cr>", "Cycle backward", mode = { "n", "x" } },
      { "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "in files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buffer" },
      { "<leader>fd", "<cmd>Telescope zoxide list<cr>", desc = "dir" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "file" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "recent" },
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "key binding" },
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "tag" },
    }
  }
