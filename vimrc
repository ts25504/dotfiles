"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Get out of VI's compatible mode..
set nocompatible

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Set syntax on
syntax on
syntax enable

" Set to auto read when a file is changed from the outside
set autoread

" Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

" Sets how many lines of history VIM has to remember
set history=700

" Set cpp header path
set path+=/usr/include/,/Library/Developer/CommandLineTools/usr/include/c++/v1,/usr/local/include

" Set tab and space visible
set list
set listchars=tab:>-,trail:-

" Fast edit vimrc
" Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

" support :E = :Explore
command! E Explore

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show current position
set ruler

" The commandbar is 2 high
set cmdheight=2

" Show line number
set nu

" Highlight search things
set hlsearch

" Set backspace
set backspace=eol,start,indent

" GUI
if has("gui_running")
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" File type indent
autocmd FileType c,cpp setlocal shiftwidth=2 tabstop=2

" go support
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4

" Change shiftwidth
map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

" Be smart  when using tabs
set smarttab

    """"""""""""""""""""""""""""""""
    " Indent
    """"""""""""""""""""""""""""""""
    " Auto indent
    set ai

    " Smart indent
    set si

    " C-Style indenting
    set cindent

    "Wrap lines
    set wrap

    """"""""""""""""""""""""""""""""
    " Statusline
    """"""""""""""""""""""""""""""""
    " Always hide the statusline
    set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>

let g:ycm_rust_src_path = "/Users/apple/src/rust/rust/src"
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" google code style format
" Plugin 'google/vim-maktaba'
" Plugin 'google/vim-codefmt'
" Plugin 'google/vim-glaive'
Plugin 'google/vim-colorscheme-primary'

" rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" python
Plugin 'mitsuhiko/vim-python-combined'

" c/cpp
Plugin 'a.vim'
Plugin 'c.vim'
Plugin 'd0f/vim-cppstl'
Plugin 'Valloric/YouCompleteMe'

" go
Plugin 'fatih/vim-go'

" Env
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'EasyGrep'

" colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim racer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
let g:racer_cmd = "/Users/apple/.cargo/bin/racer"
let $RUST_SRC_PATH="/Users/apple/src/rust/rust/src"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"

" By default vim-go shows errors for the fmt command, to disable it:
let g:go_fmt_fail_silently = 1

" Disable auto fmt on save:
let g:go_fmt_autosave = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyGrep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set font
set gfn=Source\ Code\ Pro:h12

" Set encoding
set encoding=utf8

" color scheme
set t_Co=256
set background=dark
colorscheme molokai
