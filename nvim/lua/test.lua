vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>T', ':TestFile<CR>', { silent = true, noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>a', ':TestSuite<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':TestVisit<CR>', { silent = true, noremap = true })

vim.g['test#javascript#runner'] = 'jest'

-- function! test#javascript#jest#executable() abort
--   if filereadable('node_modules/.bin/jest')
--     return 'devcontainer exec --workspace-folder . node_modules/.bin/jest'
--   else
--     return 'jest'
--   endif
-- endfunction
-- 
