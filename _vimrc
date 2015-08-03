set nocompatible              " be iMproved, required

"------------------------------------------------------------------------------------------------------------------------
" General settings for VIM
"------------------------------------------------------------------------------------------------------------------------
filetype plugin on
syntax on

au GUIEnter * simalt ~x " Start VIM maximized in Windows
"set ttyfast " smoother changes
"set ttyscroll=0 " Disable scrolling (Remove VIM screen artifact/corruption/distortion)
set number " Display line number

" If using colorscheme managed by vundle, then must set colorscheme after "call vundle#end()"
"colorscheme torte " Set color scheme
"colorscheme molokai " Set color scheme
"colorscheme dante " Set color scheme
"colorscheme black " Set color scheme
"colorscheme synic " Set color scheme
"colorscheme badwolf " Set color scheme

set clipboard=unnamed " Share clipboard with OS
set backspace=indent,eol,start " Fix backspace/delete problem (backspace/delete cannot remove line break)
set hlsearch " Highlight all search results
set ignorecase " Ignore case when searching
set sm " show matchin braces
set nobackup " No backup files
set nowritebackup
set noswapfile
set autochdir " Auto change working directory to current editing file
set expandtab " Expand tab to spaces
set tabstop=4 " Set tab stop
set shiftwidth=4 " Set shitf width
set autoread " Auto reload file
"set guioptions-=m " Remove menu bar
set guioptions-=T " Remove tool bar

" File encoding related
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  
"set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp93
set fileencoding=utf-8  
set encoding=utf-8  
set termencoding=utf-8 
scriptencoding utf-8 " Necessary for airline to correctly display unicode symbols at startup
"set bomb
set gfw=NSimsun:h10

"set gfn=Andale_Mono:h10:cANSI
set gfn=Terminus:h12:cANSI

" Set renderoptions for gvim with DirectX support
if has('win32') || has('win64')
    if (v:version == 704 && has("patch393")) || v:version > 704
        " Reference: 
        "   https://www.reddit.com/r/vim/comments/2ex6kh/set_renderoptions_windows/
        "   http://vimhelp.appspot.com/options.txt.html#%27renderoptions%27
        "   https://msdn.microsoft.com/en-us/library/windows/desktop/dd368190.aspx
        " gamma = float ('1.8 - this one really depends on your monitor')
        " contrast = float ('.5 - good for black on white (may work less well for, say, white on black)')
        " level (cleartype!) = float (' .5 - not grayscale, but not TOO fruit salad colorful, for those who are sensitive to fringing')
        " geom = int (0 - FLAT, 1 - RGB, 2 - BGR)
        " renmode = int (0 - DEFAULT, 1 - ALIASED, 2 - GDI_CLASSIC, 3 - GDI_NATURAL, 4 - NATURAL, 5 - NATURAL_SYMMETRIC, 6 - OUTLINE)
        " taamode = int (0 - DEFAULT, 1 - CLEARTYPE, 2 - GRAYSCALE, 3 - ALIASED) (see this)
        set renderoptions=type:directx,
                    \level:2.5, "float
                    \gamma:2.0, "float
                    \contrast:2.0, "float
                    \geom:0,
                    \renmode:0,
                    \taamode:0
    end
end

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
nnoremap <C-w> :q!<CR>
vnoremap <C-w> <ESC>:q!<CR>
inoremap <C-w> <ESC>:q!<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <ESC>:update<CR>
inoremap <C-S> <ESC>:update<CR>

" Add new line below
nnoremap oo o<ESC>

" Execute current file
nnoremap <F5> :!%<CR>

" vimgrep current word in current file
nnoremap <leader>ff :execute "noautocmd vimgrep /\\c" . expand("<cword>") . "/j %" <Bar> cw
vnoremap <leader>ff "zy <Bar> :execute "noautocmd vimgrep /\\c<C-R>z/j %" <Bar> cw

" vimgrep current word in current directory 
nnoremap <leader>fd :execute "noautocmd vimgrep /\\c" . expand("<cword>") . "/j ./**/*" <Bar> cw
vnoremap <leader>fd "zy <Bar> :execute "noautocmd vimgrep /\\c<C-R>z/j ./**/*" <Bar> cw

" Register command
nnoremap <A-F1> @a
nnoremap <A-F2> @b
nnoremap <A-F3> @c
nnoremap <A-F4> @d
nnoremap <A-F5> @e
nnoremap <A-F6> @f
nnoremap <A-F7> @g
nnoremap <A-F8> @h
nnoremap <A-F9> @i
nnoremap <A-F10> @j
nnoremap <A-F11> @k
nnoremap <A-F12> @l

" Switch to visual mode and select all
nnoremap <C-a> ggVG
vnoremap <C-a> <ESC>ggVG
inoremap <C-a> <ESC>ggVG

" Yank to clipboard and return to normal mode
nnoremap <C-c> "+y
vnoremap <C-c> "+y
inoremap <C-c> <ESC>"+y

" Paste clipboard and return to normal mode
nnoremap <C-v> "+gP
vnoremap <C-v> "+gP
inoremap <C-v> <ESC>"+gP

"------------------------------------------------------------------------------------------------------------------------
" Vundle
"------------------------------------------------------------------------------------------------------------------------
"set nocompatible              " be iMproved, required (Moved to top)
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
"Plugin 'name5566/vim-bookmark'
Plugin 'AndrewRadev/simple_bookmarks.vim'
Plugin 'vim-scripts/Visual-Mark'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
"Plugin 'powerline/powerline'
Plugin 'tomasr/molokai' "color scheme
"Plugin 'vim-scripts/dante.vim' "color scheme
Plugin 'sjl/badwolf' "color scheme
Plugin 'rodnaph/vim-color-schemes' "lots of color schemes

""------------------------------------------------------------------------------------------------------------------------
"" UltiSnips 
""------------------------------------------------------------------------------------------------------------------------
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"
"" Suppress warning about lacking of Python support
"let g:UltiSnipsNoPythonWarning = 1

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
" Set colorscheme after "call vundle#end()"
"------------------------------------------------------------------------------------------------------------------------
colorscheme badwolf " Set color scheme

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
""let g:bookmark_manage_per_buffer = 1
"let g:bookmark_auto_save_file = 'c:\Users\mtk03465\.vim-bookmarks'
"nmap <Leader>bt <Plug>BookmarkToggle
"nmap <Leader>bb <Plug>BookmarkToggle
"nmap <Leader>ba <Plug>BookmarkAnnotate
"nmap <Leader>bs <Plug>BookmarkShowAll
"nmap <Leader>bj <Plug>BookmarkNext
"nmap <Leader>bk <Plug>BookmarkPrev
"nmap <Leader>bc <Plug>BookmarkClear
"nmap <Leader>bx <Plug>BookmarkClearAll
"nmap <Leader>bw <Plug>BookmarkSave 'c:\Users\mtk03465\.vim-bookmarks'

"------------------------------------------------------------------------------------------------------------------------
" vim-bookmark
"------------------------------------------------------------------------------------------------------------------------
"let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'
"let g:vbookmark_disableMapping = 1
"nnoremap <silent> <leader>bt :VbookmarkToggle<CR>
"nnoremap <silent> <leader>bb :VbookmarkToggle<CR>
"nnoremap <silent> <leader>bj :VbookmarkNext<CR>
"nnoremap <silent> <leader>bk :VbookmarkPrevious<CR>
"nnoremap <silent> <leader>bg :VbookmarkGroup
"nnoremap <silent> <leader>br :VbookmarkGroupRemove

"------------------------------------------------------------------------------------------------------------------------
" simple-bookmarks
"------------------------------------------------------------------------------------------------------------------------
nnoremap <leader>bb :Bookmark 
nnoremap <leader>bj :GotoBookmark 
nnoremap <leader>bd :DelBookmark 
nnoremap <leader>bl :CopenBookmarks<CR>
let g:simple_bookmarks_signs = 1
let g:simple_bookmarks_sign_text = '+'
let g:simple_bookmarks_long_quickfix = 0
let g:simple_bookmarks_auto_close = 1
let g:simple_bookmarks_highlight = 0
let g:simple_bookmarks_new_tab = 0

"------------------------------------------------------------------------------------------------------------------------
" CtrlP
"------------------------------------------------------------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.vcproj','.vcxproj','.sln','.project','.cproject']

"------------------------------------------------------------------------------------------------------------------------
" vim-airline
"------------------------------------------------------------------------------------------------------------------------
set laststatus=2
"let g:airline_theme=badwolf
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" show buffer number
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#exclude_preview = 1
" use fancy powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_use_unicode_symbols = 1
if (g:airline_use_unicode_symbols==1)
    " Following fonts are required for airline plugin with powerline symbols support
    "set gfn=Terminus_for_Powerline:h10:cANSI
    set gfn=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
    "set gfn=Droid_Sans_Mono_Dotted_for_Powe:h10:cANSI
    "set gfn=Ubuntu_Mono_derivative_Powerlin:h12:cANSI
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '分'
    let g:airline_symbols.readonly = '讀'
    let g:airline_symbols.linenr = '行'
end

"------------------------------------------------------------------------------------------------------------------------
" molokai color theme 
"------------------------------------------------------------------------------------------------------------------------
let g:molokai_original = 0
let g:rehash256 = 0

"------------------------------------------------------------------------------------------------------------------------
" Functions
"------------------------------------------------------------------------------------------------------------------------
function! Log2txt()
    "!perl d:\tool\perl\script\log2txt.pl %
    %s/\r//g
endfunction
command! Log2txt call Log2txt() %
command! LogToTxt call Log2txt() %

function! ParseVp9FrameInfo()
    !perl d:\tool\perl\script\parse_vp9_frame_info.pl %
endfunction
command! ParseVp9FrameInfo call ParseVp9FrameInfo()

function! ParseVp9DecodeTime()
    vimgrep /VP9 decode time/j % | cw
    copen
    exec "normal! \"zggVGy"
    ccl
    tabnew
    exec "normal! ggVGp"
    %s/.*VP9 decode time: //g
    %s/\r//g
    update
endfunction
command! ParseVp9DecodeTime call ParseVp9DecodeTime() 

function! ParseFpsLog()
    vimgrep /\cfps/j % | cw
    copen
    exec "normal! \"zggVGy"
    ccl
    tabnew
    exec "normal! ggVGp"
    %s/.*col \d\+|//g
    %s/\r//g
    update
endfunction
command! ParseFpsLog call ParseFpsLog()

function! CloseHiddenBuffers()
    let visible = {}
    for t in range(1, tabpagenr('$'))
        for b in tabpagebuflist(t)
            let visible[b] = 1
        endfor
    endfor
    for b in range(1, bufnr('$'))
        if bufexists(b) && !has_key(visible, b)
            execute 'bwipeout' b
        endif
    endfor
endfun
command! FlushBuffers call CloseHiddenBuffers()

"------------------------------------------------------------------------------------------------------------------------
" End
"------------------------------------------------------------------------------------------------------------------------
set viminfo+=! " Save global variables in viminfo file
set sessionoptions+=globals " Save global variables to session files
set sessionoptions+=options " Save session options to session files to restore syntax highlighting

" Required Settings for vimwiki
filetype plugin on
syntax on

