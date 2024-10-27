local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Directory navigation
keymap.set("n", "<C-n>", ":Neotree toggle left<CR>", opts)
keymap.set("n", "<leader>n", ":Neotree toggle left<CR>", opts)
