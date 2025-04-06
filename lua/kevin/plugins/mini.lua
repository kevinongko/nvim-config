return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = false,
  config = function()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.comment').setup({
      mappings = {
        comment_line = '<leader>cc'
      }
    })
    require('mini.icons').setup()
    require('mini.tabline').setup()
    require('mini.trailspace').setup({
      only_in_normal_buffers = true
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        require('mini.trailspace').trim()
      end,
    })
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      callback = function()
      local bufname = vim.fn.expand('%:t')
      if bufname == "" or -- empty buffer
         string.match(vim.api.nvim_buf_get_name(0), "Snacks") or
         vim.bo.filetype == "snacks" then
         vim.b.minitrailspace_disable = true
      end
    end,
  })
  end
}
