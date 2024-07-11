return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  config = function()
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
      toggler = {
        line = "<leader>cc",
        block = "<leader>cb"
      },
      opleader = {
        line = "<leader>cc",
        block = "<leader>cb"
      },
      extra = {
        above = "<leader>ca",
        below = "<leader>cu",
        eol = "<leader>ce"
      }
    })
  end
}
