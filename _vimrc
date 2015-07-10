"------------------------------------------------------------------------------------------------------------------------
" General settings for VIM
"------------------------------------------------------------------------------------------------------------------------
filetype plugin on
syntax on

" Set font
"set guifont=Terminus:h11:cANSI

" Start VIM maximized in Windows
au GUIEnter * simalt ~x

" Display line number
set number

" Set color scheme
colorscheme torte

" Share clipboard with OS
set clipboard=unnamed

" Fix backspace/delete problem (backspace/delete cannot remove line break)
set backspace=indent,eol,start

" Highlight all search results
set hlsearch

" No backup files
set nobackup
set nowritebackup

" Auto change working directory to current editing file
set autochdir

" Expand tab to spaces
set expandtab

" Set tab stop
set tabstop=4

" Set shitf width
set shiftwidth=4

" File encoding related
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp93
set fileencoding=utf-8  
set encoding=utf-8  
set termencoding=utf-8 
"set gfn=Monaco:h10:cANSI
"set gfn=Terminus:h10:cANSI
set gfn=Andale_Mono:h9:cANSI
set gfw=NSimsun:h10

" Auto reload file
set autoread

"------------------------------------------------------------------------------------------------------------------------
" General key mappings for VIM
"------------------------------------------------------------------------------------------------------------------------
let mapleader = ","

" Switch to left/right tab
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
nnoremap <S-H> :tabprevious<CR>
nnoremap <S-L> :tabnext<CR>

" Move tab to left/right
nnoremap <A-S-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <A-S-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <S-J> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <S-K> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Switch to top/down/left/right window
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-Right> :wincmd l<CR>
nnoremap <C-K> :wincmd k<CR>
nnoremap <C-J> :wincmd j<CR>
nnoremap <C-H> :wincmd h<CR>
nnoremap <C-L> :wincmd l<CR>

" New tab
nnoremap <leader>tn :tabnew<CR>
nnoremap <C-n> :tabnew<CR>

" Close tab 
nnoremap <leader>tc :tabclose<CR>

" Close file 
nnoremap <C-w> :q<CR>
inoremap <C-w> <ESC>:q<CR>
vnoremap <C-w> <ESC>:q<CR>

" Save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>

" Add new line below
nnoremap oo o<ESC>k

" Execute current file
nnoremap <F5> :!%<CR>

" vimgrep current word in current file
nnoremap <leader>ff :execute "noautocmd vimgrep /\\c" . expand("<cword>") . "/j %" <Bar> cw<CR>
vnoremap <leader>ff "zy <Bar> :execute "noautocmd vimgrep /\\c<C-R>z/j %" <Bar> cw<CR>

" vimgrep current word in current directory 
nnoremap <leader>fd :execute "noautocmd vimgrep /\\c" . expand("<cword>") . "/j ./**/*" <Bar> cw<CR>
vnoremap <leader>fd "zy <Bar> :execute "noautocmd vimgrep /\\c<C-R>z/j ./**/*" <Bar> cw<CR>

" Register command
nnoremap <A-F1> @a
nnoremap <A-F2> @b

" Switch to visual mode and select all
nnoremap <C-a> ggVG
inoremap <C-a> ggVG
vnoremap <C-a> ggVG

" Yank to clipboard and return to normal mode
nnoremap <C-c> "+y
inoremap <C-c> "+y
vnoremap <C-c> "+y

" Paste clipboard and return to normal mode
nnoremap <C-v> "+P
inoremap <C-v> "+P
vnoremap <C-v> "+P

"------------------------------------------------------------------------------------------------------------------------
" Vundle
"------------------------------------------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Plugin 'EinfachToll/vimwiki'
Plugin 'vimwiki/vimwiki'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'sunteen/highlights.vim'
Plugin 'amiorin/vim-project'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
"Plugin 'xolox/vim-easytags'
"Plugin 'amiorin/vim-bookmarks'
"Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'vim-scripts/Visual-Mark'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeToggle<CR>

"------------------------------------------------------------------------------------------------------------------------
" Taglist
"------------------------------------------------------------------------------------------------------------------------
nnoremap <leader>t :TlistToggle<CR>

"------------------------------------------------------------------------------------------------------------------------
" xolox/vim-session
"------------------------------------------------------------------------------------------------------------------------
let g:session_autosave = 'no'

"------------------------------------------------------------------------------------------------------------------------
" vim-bookmarks
"------------------------------------------------------------------------------------------------------------------------
"let g:bookmark_auto_close = 1
"let g:bookmark_highlight_lines = 1
"let g:bookmark_sign = '>>'
"let g:bookmark_annotation_sign = '##'
"let g:bookmark_auto_save = 1
"nmap <Leader>bt <Plug>BookmarkToggle
"nmap <Leader>bi <Plug>BookmarkAnnotate
"nmap <Leader>ba <Plug>BookmarkShowAll
"nmap <Leader>bj <Plug>BookmarkNext
"nmap <Leader>bk <Plug>BookmarkPrev
"nmap <Leader>bc <Plug>BookmarkClear
"nmap <Leader>bx <Plug>BookmarkClearAll

"------------------------------------------------------------------------------------------------------------------------
" End
"------------------------------------------------------------------------------------------------------------------------
"
" Save global variables in viminfo file
set viminfo+=!

" Save global variables to session files
set sessionoptions+=globals

" Required Settings for vimwiki
filetype plugin on
syntax on
