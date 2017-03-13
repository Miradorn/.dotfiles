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


set lazyredraw

runtime macros/matchit.vim

if has("gui_running")
    set guioptions=egmrt
endif
set termguicolors

let mapleader = "\<Space>"
noremap \ ,

set binary

set undofile

" presentation settings
set number              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)

set wrap

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmode=longest,list,full
set wildmenu            " enhanced command completion
set laststatus=2        " always show the status lines
set list
set listchars=tab:→\ ,trail:·

" Cursor shape
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set colorcolumn=120

set shell=$SHELL        " use current shell for shell commands

set history=1000
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start

set autoindent          " automatically indent new line

set tabstop=2           " number of spaces in a tab
set shiftwidth=2        " number of spaces for indent
set expandtab           " expand tabs into spaces

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

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim" path to dein.vim

if dein#load_state(expand('~/.vim/dein')) " plugins' root path
  call dein#begin(expand('~/.vim/dein')) " plugins' root path

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#local("~/.vim/custom/")

  " Required for settings
  "
  "
  " Languages
  call dein#add('sheerun/vim-polyglot')

  " Compile/Test

  call dein#add('neomake/neomake')
  call dein#add('kassio/neoterm')
  call dein#add('janko-m/vim-test')

  " Tags
  call dein#add('ludovicchabant/vim-gutentags')


  " NerdTree
  call dein#add('scrooloose/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  " Ruby
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rbenv')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-bundler')

  " " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " other

  call dein#add('tpope/vim-projectionist')

  call dein#add('tpope/vim-commentary')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('wellle/targets.vim')
  call dein#add('chriskempson/base16-vim')

  " call dein#add('scrooloose/syntastic')

  call dein#add('majutsushi/tagbar')

  call dein#add('rizzatti/dash.vim')
  call dein#add('junegunn/fzf', { 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('yssl/QFEnter')

  " call dein#add('haya14busa/incsearch.vim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround')
  call dein#add('AndrewRadev/splitjoin.vim')
  " call dein#add('edkolev/tmuxline.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('editorconfig/editorconfig-vim')

  call dein#add('tpope/vim-repeat')
  call dein#add('Konfekt/FastFold')
  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('jeetsukumaran/vim-buffergator')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('mattreduce/vim-mix')
  call dein#add('mhinz/vim-startify')

  " call dein#add('lervag/vimtex')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('fishbullet/deoplete-ruby')
  call dein#add('terryma/vim-expand-region')
  call dein#add('ryanoasis/vim-devicons')

  call dein#end()
  call dein#save_state()
endif

let g:polyglot_disabled = ['latex']

let g:dein#enable_notification=1
let g:dein#install_progress_type='none'

nnoremap <leader>u :call dein#update()<cr>
nnoremap <leader>i :call dein#install()<cr>
nnoremap <leader>cc :call map(dein#check_clean(), "delete(v:val, 'rf')")<cr>

filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme base16-tomorrow-night

" NeoMake
" On every open and save
autocmd! BufEnter * Neomake
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_haml_enabled_makers = ['hamllint']
let g:neomake_scss_enabled_makers = ['scsslint']

" NERDTree
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeShowHidden=1
autocmd User Startified setlocal buftype=

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['ex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['eex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['exs'] = 'cc6666'

noremap <Leader>n :NERDTreeToggle<CR>

" Exit if NERDTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree automatically on start but keep focus on mainwindow
" autocmd StdinReadPre * let s:std_in=1
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p

""" AirLine

let g:airline_powerline_fonts = 1
let g:airline_theme="base16_tomorrow"

let airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#enabled = 1

""" Dash
nmap <silent> <leader>d <Plug>DashSearch


""" Tags
let g:gutentags_cache_dir = '~/.tags_cache'
noremap <Leader>t :TagbarToggle<CR>

""" FZF
nnoremap <Leader>o :Files<CR>
nnoremap <C-p> :Files<CR>
inoremap <C-p> :Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'up': '~30%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden -U -g ""'

"Test
let test#strategy = "neoterm"

nnoremap <silent> <leader>s :TestNearest<CR>
nnoremap <silent> <leader>S :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

nnoremap <silent> <leader>tq :call neoterm#close()<cr>

let g:neoterm_size='15'

" incsearch

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" Buffergator

let g:buffergator_viewport_split_policy = "T"
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>

" let g:SuperTabDefaultCompletionType = "context"

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby set iskeyword+=?,!
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" custom

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
map q: :q
nnoremap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

onoremap p i(

nnoremap <CR> G
nnoremap <BS> gg

" cycle windows with tab
" nnoremap <Tab> <C-W>w
" nnoremap <S-Tab> <C-W>W


" move by screen line
nnoremap j gj
nnoremap k gk

if has("nvim")
    " For terminal mode
    tnoremap <Esc> <C-\><C-n>
end

let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100
" let g:deoplete#disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:startify_change_to_dir = 0

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

let g:alchemist_tag_disable = 1

" Tmuxline

let g:tmuxline_preset = {
      \ 'a'    : ['#h', '#S'],
      \ 'win'  : '#I #W',
      \ 'cwin' : '#I #W',
      \ 'y'    : ['%R', '%a'],
      \ 'z'    : '#{battery_status_bg}#{battery_icon} #{battery_percentage}',
      \ 'options': {
      \   'status-justify': 'left',
      \   'status-bg': 'colour234'}
      \}

" Airline setup
call airline#parts#define('mymode', {
            \ 'function': 'airline#parts#mode',
            \ })
call airline#parts#define('mylinenr', {
            \ 'raw': '%{g:airline_symbols.linenr}%4l',
            \ })
call airline#parts#define('mymaxlinenr', {
            \ 'raw': '/%L%{g:airline_symbols.maxlinenr}',
            \ })

function! AirlineInit()
    let spc = g:airline_symbols.space
    let g:airline_section_a = airline#section#create_left(['mymode', 'crypt', 'paste', 'spell', 'capslock', 'iminsert'])
    let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%'.spc, 'mylinenr', 'mymaxlinenr', spc.':%3v'])
endfunction
autocmd VimEnter * call AirlineInit()
