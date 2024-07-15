return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "nix",
        "rust",
        "php",
        "jsdoc",
        "bash",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "dockerfile",
        "gitignore",
        "vue",
        "rust"
      },
    })
  end
}
