-- wslでyankとクリップボードと同期するための設定
vim.cmd [[
if system('uname -a | grep Microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif
]]
