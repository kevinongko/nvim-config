require("kevin.core.options")
require("kevin.core.keymaps")

-- use buffer delete on quit
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function() vim.cmd("bd") end
})
