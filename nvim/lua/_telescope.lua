local builtin = require('telescope.builtin')
require "telescope".load_extension "egrepify"

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.egrepify.egrepify, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
