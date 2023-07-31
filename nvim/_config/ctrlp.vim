" ctrlPの設定
" 全てのファイルが現れるようにする
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden = 1

" 不要なファイルは除外する
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|dist'

" agのインストールが必要 ex) brew install ag
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif
