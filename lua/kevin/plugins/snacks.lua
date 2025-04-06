return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<F1>", function() require("snacks").picker.files() end, desc = "Toggle Picker" },
    { "<F3>", function() require("snacks").terminal.toggle() end, desc = "Toggle Terminal" },
    { "<F3>", function() require("snacks").terminal.toggle() end, mode = "t", desc = "Toggle Terminal" },
    { "<F5>", function() require("snacks").explorer.open() end, desc = "Toggle Explorer" },
    { "<F6>", function() require("snacks").lazygit.open() end, desc = "Toggle Lazygit" },
    { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find files in project" },
    { "<leader>fs", function() require("snacks").picker.grep() end, desc = "Find string in project" },
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true
    },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          actions = {
            explorer_open = "edit"
          },
        }
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = {
      enabled = true,
      shell = "nu"
    },
    words = { enabled = true },
  }
}

