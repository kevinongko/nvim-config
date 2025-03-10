return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      -- General settings
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal", -- Default direction
      float_opts = {
        border = "curved",
      },
      open_mapping = [[<C-t>]],  -- Key mapping to toggle terminal
    }

    -- Terminal window mapping
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    end
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    -- Key mappings to open new terminals in horizontal and vertical splits
    vim.api.nvim_set_keymap('n', '<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>tv', '<Cmd>ToggleTerm direction=vertical<CR>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', {noremap = true, silent = true})
  end,
}
