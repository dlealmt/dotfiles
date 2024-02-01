  return {
    "nvim-lualine/lualine.nvim",
    config = function()
      local timbuktu = require("lualine.themes.gruvbox")

      require("lualine").setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          theme = timbuktu,
        },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1, 1) end },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "progress", "location" },
        },
        winbar = {
          lualine_a = {
            "buffers"
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        inactive_winbar = {
          lualine_a = {
            "buffers"
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
      })
    end,
  }
