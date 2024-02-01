  return {
    "folke/which-key.nvim",
    config = function()
      require("which-key").register({
        ["<c-n>"] = { "<Plug>(YankyCycleBackward)", "Cycle backward", mode = { "n", "x" } },
        ["<c-p>"] = { "<Plug>(YankyCycleForward)", "Cycle forward", mode = { "n", "x" } },
        ["<C-s>"] = { "<cmd>w<cr>", "Save" },
        s = {
          function() require("leap").leap({ target_windows = { vim.fn.win_getid() } }) end,
          "Leap to",
          mode = { "n", "o", "x" }
        },
        S = { function() require("leap-ast").leap() end, "Leap AST", mode = { "n", "o", "x" } },
        ["<leader>"] = {
          ["<space>"] = { "<cmd>noh<cr>", "Clear highlights" },
          f = { name = "Find...", },
          h = { name = "Help...", },
        },
        P = { "<Plug>(YankyPutBefore)", "Put before", mode = { "n", "x" } },
        ["["] = {
          name = "Previous...",
          b = { "<cmd>bprev<cr>", "Previous buffer" },
          q = { "<cmd>cprev<cr>", "quickfix" },
        },
        ["]"] = {
          name = "Next...",
          b = { "<cmd>bnext<cr>", "Next buffer" },
          q = { "<cmd>cnext<cr>", "quickfix" },
        },
        p = { "<Plug>(YankyPutAfter)", "Put after", mode = { "n", "x" } },
        q = { "<cmd>bd<cr>", "Kill buffer" },
        y = { "<Plug>(YankyYank)", "Yank" },
      })
    end
  }
