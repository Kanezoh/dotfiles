-- setting
-- 文字コードをUFT-8に設定
vim.o.fenc="utf-8"
-- バックアップファイルを作らない
vim.o.backup=false
-- スワップファイルを作らない
vim.o.swapfile=false
-- 編集中のファイルが変更されたら自動で読み直す
vim.o.autoread=true
-- バッファが編集中でもその他のファイルを開けるように
vim.o.hidden=true
-- 入力中のコマンドをステータスに表示する
vim.o.showcmd=true
vim.o.mmp=2000

-- 見た目系
-- 行番号を表示
vim.o.number=true
-- 行末の1文字先までカーソルを移動できるように
vim.o.virtualedit="onemore"
-- インデントはスマートインデント
vim.o.smartindent=true
-- ビープ音を可視化
vim.o.visualbell=true
-- 括弧入力時の対応する括弧を表示
vim.o.showmatch=true
-- ステータスラインを常に表示
vim.o.laststatus=2
-- コマンドラインの補完
vim.o.wildmode="list:longest"
-- 折り返し時に表示行単位での移動できるようにする
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Tab系
-- Tab文字を半角スペースにする
vim.o.expandtab=true
-- 行頭以外のTab文字の表示幅（スペースいくつ分）
vim.o.tabstop=2
-- 行頭でのTab文字の表示幅
vim.o.shiftwidth=2

-- 検索系
-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
vim.o.ignorecase=true
-- 検索文字列に大文字が含まれている場合は区別して検索する
vim.o.smartcase=true
-- 検索文字列入力時に順次対象文字列にヒットさせる
vim.o.incsearch=true
-- 検索時に最後まで行ったら最初に戻る
vim.o.wrapscan=true
-- 検索語をハイライト表示
vim.o.hlsearch=true
-- ESC連打でハイライト解除
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>')

-- 括弧、波括弧を自動で補完する
vim.keymap.set('i', '{', '{}<LEFT>')
vim.keymap.set('i', '[', '[]<LEFT>')
vim.keymap.set('i', '(', '()<LEFT>')

-- 不可視文字を可視化する
vim.o.list=true
vim.o.listchars="tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"

-- カラースキーム
vim.cmd[[
set bg=light
set termguicolors
colorscheme pencil
let g:pencil_higher_contrast_ui = 1
]]

vim.cmd[[
   colorscheme jellybeans
]]
-- set termguicolors
-- colorscheme cyberpunk
-- let g:airline_theme='cyberpunk'


-- 背景透過の設定
-- vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none'
-- vim.cmd 'autocmd ColorScheme * highlight NonText ctermbg=none'
-- vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none'
-- vim.cmd 'autocmd ColorScheme *  highlight Folded ctermbg=none'
-- vim.cmd 'autocmd ColorScheme *  highlight EndOfBuffer ctermbg=none '
-- vim.opt.winblend = 0 -- ウィンドウの不透明度
-- vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

-- leaderキーをspaceに割り当てる
 vim.g.mapleader = " "

-- クリップボードを同期
vim.o.clipboard = "unnamedplus"

vim.cmd [[
command! CpPath let @+ = expand('%')
command! CpFullPath let @+ = expand('%:p')
]]

vim.cmd[[
set wildignore+=*/node_modules/**
set wildignore+=*/dist/**
set wildignore+=*/japanese-addresses-master/**
]]

-- rustfmtの設定
vim.g.rustfmt_autosave = 1

vim.cmd [[
" https://qiita.com/izumin5210/items/d2e352de1e541ff97079
" <C-w> 系を Vim Tmux Navigator に移譲する
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\\ :TmuxNavigatePrevious<cr>
]]

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'dense-analysis/ale'
  Plug 'vim-airline/vim-airline'
  Plug('neoclide/coc.nvim', {branch='release'})
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/webapi-vim'
  Plug 'tyru/open-browser.vim'
  Plug 'h1mesuke/unite-outline'
  Plug 'basyura/bitly.vim'
  Plug 'Shougo/unite.vim'
  Plug 'vim-test/vim-test'
  Plug 'rking/ag.vim'
  Plug 'preservim/nerdtree'
  Plug 'thedenisnikulin/vim-cyberpunk'
  Plug 'tpope/vim-commentary'
  Plug 'rust-lang/rust.vim'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'zbirenbaum/copilot.lua'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'tpope/vim-surround'
  Plug('CopilotC-Nvim/CopilotChat.nvim', { branch='canary' })
  Plug ('nvim-telescope/telescope.nvim', { tag='0.1.8' })
  Plug 'fdschmidt93/telescope-egrepify.nvim'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'christoomey/vim-tmux-navigator'
vim.call('plug#end')

require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}

-- runtime! _config/*.vim
require("ale")
require("tabpage")
require("nerdtree")
require("clipboard")
require("coc")
require("terminal")
require("fugitive")
require("quickfix")
require("_telescope")
require("_lazygit")
require("test")

