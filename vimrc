""" Settings

set nocompatible
filetype on                   " without this vim emits a zero exit status, later, because of :ft off"
filetype off                  " required
syntax enable

set term=xterm-256color
set ttymouse=xterm2
set t_Co=256
set t_ut=


let mapleader = ","

set encoding=utf-8
set binary

" presentation settings
set number              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)

set wrap

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmenu            " enhanced command completion
set laststatus=2        " always show the status lines
set list
set listchars=tab:→\ ,trail:·,nbsp:·

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.\+/

set shell=$SHELL        " use current shell for shell commands

set history=1000
set autoread            " automatically read feil that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start

set autoindent          " automatically indent new line

set ts=4                " number of spaces in a tab
set sw=4                " number of spaces for indent
set et                  " expand tabs into spaces

if has("mouse")
  set mouse=a
endif
set mousehide           " Hide mouse pointer on insert mode."

set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" directory settings
set nobackup            " do not write backup files
set noswapfile          " do not write .swp files



set splitbelow
set splitright

""" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself
Plugin 'VundleVim/Vundle.vim'


" Required for settings
Plugin 'chriskempson/base16-vim'


" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

" Ruby
Plugin 'tpope/vim-rbenv'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" other

Plugin 'joshdick/onedark.vim'
Plugin 'mattn/emmet-vim'

Plugin 'scrooloose/syntastic'

Plugin 'majutsushi/tagbar'

Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rizzatti/dash.vim'
Plugin 'kien/ctrlp.vim'


Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

Plugin 'edkolev/tmuxline.vim'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'rking/ag.vim'
Plugin 'NLKNguyen/papercolor-theme'


"Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set background=dark
colorscheme PaperColor
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:nerdtree_tabs_open_on_console_startup = 1
map <Leader>n <plug>NERDTreeTabsToggle<CR>

""" Plugin Settings

let g:airline_powerline_fonts = 1
let g:airline_theme="PaperColor"

:nmap <silent> K <Plug>DashSearch

"TagBar

map <Leader>t :TagbarToggle<CR>
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)

"CTRLP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window_bottom = 0
"CTRLP
let g:ctrlp_working_path_mode = 0

"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NeoComplete

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'"
let g:neocomplete#auto_completion_start_length = 2

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
