return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files TELESCOPE" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "grep codebase TELESCOPE" })
  end,
}
