nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:test#javascript#runner = 'jest'
" function! test#javascript#jest#executable() abort
"   if filereadable('node_modules/.bin/jest')
"     return 'devcontainer exec --workspace-folder . node_modules/.bin/jest'
"   else
"     return 'jest'
"   endif
" endfunction
" 
