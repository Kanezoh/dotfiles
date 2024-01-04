-- quickfixのショートカット
vim.keymap.set('n', 'cp', ':cprevious<CR>')
vim.keymap.set('n', 'cn', ':cnext<CR>')

-- vimgrep使用時に結果をQuickFixで開く
vim.cmd[[autocmd QuickFixCmdPost *grep* cwindow]]

