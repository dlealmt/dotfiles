  return {
    "gbprod/yanky.nvim",
    opts = {
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500
      },
      preserve_cursor_position = {
        enabled = true
      },
      ring = {
        storage = "sqlite",
      },
      system_clipboard = {
        sync_with_ring = false
      },
    },
    dependencies = {
      "kkharji/sqlite.lua"
    },
  }
