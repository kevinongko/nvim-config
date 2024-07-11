vim.g.mapleader = " "

-- below is custom keymaps
local keymap = vim.keymap

-- split window
keymap.set("n", "<F2>", "<C-W>w", { desc = "Jump window" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- tab management
keymap.set("n", "<leader>tj", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tk", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>1", "<cmd>tabn<CR>", { desc = "Go to next tab" })
