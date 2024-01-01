vim.cmd [[
" settings for tabpage
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示
" The prefix key.
" nnoremap    [Tag]   <Nop>
" nmap    t [Tag]
]]

-- The prefix key.
-- vim.api.nvim_set_keymap('n', '[Tag]', '<Nop>', { noremap = true })
-- vim.api.nvim_set_keymap('n', 't[Tag]', ':', { noremap = true })

-- -- 常にタブラインを表示
-- vim.o.showtabline=2 
-- 
-- tn 次のタブ
vim.api.nvim_set_keymap('n', '[Tag]n', ':tabnext<CR>', { silent = true, noremap = true })
-- tp 前のタブ
vim.api.nvim_set_keymap('n', '[Tag]p', ':tabprevious<CR>', { silent = true, noremap = true })
-- tc タブを作成
vim.api.nvim_set_keymap('n', '[Tag]c', ':tablast <bar> tabnew<CR>', { silent = true, noremap = true })

-- Tab jump
-- t[タブ番号]で指定のタブ番号のタブにジャンプ
for n = 1, 9 do
  vim.api.nvim_set_keymap('n', '[Tag]' .. n, ':<C-u>tabnext' .. n .. '<CR>', { silent = true, noremap = true })
end

