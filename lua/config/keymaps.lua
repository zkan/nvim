local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Directory navigation
keymap.set("n", "<C-n>", ":Neotree toggle left<CR>", opts)
keymap.set("n", "<leader>n", ":Neotree toggle left<CR>", opts)

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments (_ represents /)
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })

-- Ruby
local run_ruby_test = function()
  local current_file = vim.fn.expand('%:p')
  local test_string = "silent !zellij run -d Down -n 'testing' -- ruby " .. current_file
  vim.api.nvim_command(test_string)
end

-- Rails
local run_test = function()
  local current_file = vim.fn.expand('%:p')
  local test_string = "silent !zellij run -d Down -n 'testing' -- bin/rails test " .. current_file
  vim.api.nvim_command(test_string)
end

local run_all_tests = function()
  local test_string = "silent !zellij run -d Down -n 'testing' -- bin/rails test"
  vim.api.nvim_command(test_string)
end

vim.api.nvim_create_user_command('RunRubyTest', run_ruby_test, {})
vim.api.nvim_create_user_command('RunTest', run_test, {})
vim.api.nvim_create_user_command('RunAllTests', run_all_tests, {})

vim.keymap.set("n", "<leader>r", ":RunRubyTest<CR>", { desc = "run current file test" })
vim.keymap.set("n", "<leader>t", ":RunTest<CR>", { desc = "run current file test" })
vim.keymap.set("n", "<leader>a", ":RunAllTests<CR>", { desc = "run all tests" })
