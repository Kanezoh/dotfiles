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
set termguicolors
colorscheme cyberpunk
let g:airline_theme='cyberpunk'
]]

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

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'dense-analysis/ale'
  Plug 'vim-airline/vim-airline'
  Plug('neoclide/coc.nvim', {branch='release'})
  Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
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
vim.call('plug#end')

-- runtime! _config/*.vim
require("ale")
require("tabpage")
require("nerdtree")
require("clipboard")
require("coc")
require("ctrlp")
require("terminal")
require("fugitive")
require("quickfix")
require("test")

