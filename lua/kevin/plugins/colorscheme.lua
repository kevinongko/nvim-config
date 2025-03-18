return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- Choose: "storm", "moon", "night", "day"
    transparent = false, -- Enable this for transparent background
    terminal_colors = true, -- Set terminal colors
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
    },
  },
  config = function(_, opts)
    -- Load the colorscheme
    require("tokyonight").setup(opts)
    -- Set the colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
