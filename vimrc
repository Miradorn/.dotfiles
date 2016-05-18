""" Settings

"For training

inoremap <Up> <Esc>
nnoremap <Up> <Esc>
inoremap <Down> <Esc>
nnoremap <Down> <Esc>
inoremap <Left> <Esc>
nnoremap <Left> <Esc>
inoremap <Right> <Esc>
nnoremap <Right> <Esc>


set nocompatible
set lazyredraw
filetype on                   " without this vim emits a zero exit status, later, because of :ft off"
filetype off                  " required

runtime macros/matchit.vim

set guifont=Fira\ Code:h12

if has("gui_running")
    set guioptions=egmrt
endif
"set clipboard=unnamed

"set term=xterm-256color
"set ttymouse=xterm2
"set t_Co=256
"set t_ut=

let mapleader = ","
let mapleader = "\<Space>"
noremap \ ,

"set encoding=utf-8
set binary

set undofile

" presentation settings
set number              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)
" set relativenumber

set wrap

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmode=longest,list,full
set wildmenu            " enhanced command completion
set laststatus=2        " always show the status lines
set list
set listchars=tab:→\ ,trail:·,nbsp:·

set colorcolumn=120

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
set gdefault
nnoremap <leader>, :noh<cr>

" directory settings
set nobackup            " do not write backup files
set noswapfile          " do not write .swp files

set splitbelow
set splitright

set foldcolumn=3
set foldmethod=syntax
set foldlevelstart=20

""" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself
Plugin 'VundleVim/Vundle.vim'


" Required for settings
Plugin 'chriskempson/base16-vim'


" NerdTree
Plugin 'scrooloose/nerdtree'

" Ruby
Plugin 'tpope/vim-rbenv'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'

Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch.git'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" other
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

Plugin 'tpope/vim-commentary'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'

Plugin 'mattn/emmet-vim'


Plugin 'scrooloose/syntastic'

Plugin 'majutsushi/tagbar'

Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rizzatti/dash.vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'yssl/QFEnter'

Plugin 'haya14busa/incsearch.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
"
Plugin 'rking/ag.vim'
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'tpope/vim-repeat'


Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'ervandew/supertab'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'mattreduce/vim-mix'
Plugin 'mhinz/vim-startify'

Plugin 'Shougo/deoplete.nvim'

Plugin 'terryma/vim-expand-region'

Plugin 'ryanoasis/vim-devicons'"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme dracula
hi Search ctermfg=17 ctermbg=228 cterm=NONE guifg=#282a36 guibg=#f1fa8c gui=NONE

autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeShowHidden=1
autocmd User Startified setlocal buftype=

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ex', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('exs', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

noremap <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree | wincmd p

""" Plugin Settings

let g:airline_powerline_fonts = 1
let g:airline_theme="dracula"

let airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#enabled = 1

nnoremap <silent> D <Plug>DashSearch

"TagBar
noremap <Leader>t :TagbarToggle<CR>

"CTRLP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/_build/*
let g:ctrlp_user_command = 'ag %s -i -l --nocolor --hidden -g ""'
let g:ctrlp_match_window = 'top'
let g:ctrlp_use_caching = 0
nnoremap <Leader>o :CtrlP<CR>

"Test
nnoremap <silent> <leader>s :TestNearest<CR>
nnoremap <silent> <leader>S :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

let test#strategy = "dispatch"

"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Buffergator

let g:buffergator_viewport_split_policy = "T"
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>

" let g:SuperTabDefaultCompletionType = "context"

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
au BufNewFile,BufRead *.json.jbuilder set ft=ruby


" Easier Split Navigation
" noremap <C-J> <C-W><C-J>
" noremap <C-K> <C-W><C-K>
" noremap <C-L> <C-W><C-L>
" noremap <C-H> <C-W><C-H>

" custom

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
map q: :q
nnoremap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

onoremap p i(

nnoremap <CR> G
nnoremap <BS> gg


" move by screen line
nnoremap j gj
nnoremap k gk

if has("nvim")
    " For terminal mode
    tnoremap <Esc> <C-\><C-n>
end

let g:EditorConfig_core_mode = 'external_command'
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:deoplete#disable_auto_complete = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:startify_change_to_dir = 0
hi Normal guibg=none
highlight NonText guibg=none

let g:tagbar_type_elixir = {
    \ 'ctaghlight NonText guibg=nonegstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

