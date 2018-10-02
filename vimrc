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
set regexpengine=1

set termguicolors

let mapleader = "\<Space>"

" set binary

set undofile

" presentation settings
set number              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)

set wrap
set breakindent
set breakindentopt=shift:2

set showmatch           " Show matching brackets.
set wildmode=longest,list,full
set list
set listchars=tab:→\ ,trail:·,nbsp:+
set cursorline

" Cursor shape
" :set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      " \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      " \,sm:block-blinkwait175-blinkoff150-blinkon175

set colorcolumn=120

set shell=$SHELL        " use current shell for shell commands

set history=1000

set tabstop=2           " number of spaces in a tab
set shiftwidth=2        " number of spaces for indent
set expandtab           " expand tabs into spaces

if has("mouse")
    set mouse=a
endif
set mousehide           " Hide mouse pointer on insert mode."

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

""" Dein
let g:dein#install_log_filename = '~/.dein.log'
let g:dein#install_progress_type = 'tabline' " else maybe tabline
let g:dein#enable_notification = 1

""" Plugins

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim/" path to dein.vim

if dein#load_state(expand('~/.vim/dein')) " plugins' root path
  call dein#begin(expand('~/.vim/dein')) " plugins' root path

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim/')

  " Languages
  call dein#add('sheerun/vim-polyglot')
  call dein#add('jparise/vim-graphql')

  " Compile/Test
  call dein#add('janko-m/vim-test')
  call dein#add('kassio/neoterm')

  " NerdTree
  call dein#add('scrooloose/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  " Ruby
  call dein#add('tpope/vim-rbenv')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-bundler')

  """ Completions
  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('fishbullet/deoplete-ruby')


  " HTML
  call dein#add('mattn/emmet-vim')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " visual undo tree
  call dein#add('simnalamburt/vim-mundo')

  " movement
  call dein#add('justinmk/vim-sneak')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('wellle/targets.vim')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('tpope/vim-unimpaired')

  " colors
  call dein#add('chriskempson/base16-vim')
  call dein#add('jacoborus/tender.vim')
  call dein#add('morhetz/gruvbox')

  " other

  call dein#add('tpope/vim-projectionist')

  call dein#add('tpope/vim-commentary')

  call dein#add('rizzatti/dash.vim')
  call dein#add('junegunn/fzf', { 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround')
  call dein#add('AndrewRadev/splitjoin.vim')
  " call dein#add('edkolev/tmuxline.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('editorconfig/editorconfig-vim')

  call dein#add('tpope/vim-repeat')
  " call dein#add('Konfekt/FastFold')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('w0rp/ale')
  call dein#add('mhinz/vim-startify')

  call dein#add('terryma/vim-expand-region')
  call dein#add('ryanoasis/vim-devicons')

  call dein#end()
  call dein#save_state()
endif

let g:polyglot_disabled = ['latex']
let g:vue_disable_pre_processors = 1

nnoremap <leader>u :call dein#update()<cr>
nnoremap <leader>i :call dein#install()<cr>
nnoremap <leader>cc :call map(dein#check_clean(), "delete(v:val, 'rf')")<cr>

filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme gruvbox

" ALE Linter/formatter
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1

nnoremap <leader>f :ALEFix<cr>
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'ruby': ['rubocop'],
\   'elixir': ['mix_format']
\}

let g:ale_linters = {
\   'graphql': ['gqlint'],
\}

" NERDTree
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeShowHidden=1
autocmd User Startified setlocal buftype=

" let g:NERDTreeHighlightCursorline = 0
" let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 0
let g:NERDTreeDisableExactMatchHighlight = 0
let g:NERDTreeDisablePatternMatchHighlight = 0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'ex', 'eex', 'exs', 'haml', 'js', 'css', 'yml', 'yaml', 'sh', 'json', 'vue', 'conf', 'scss', 'sass']

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['ex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['eex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['exs'] = 'cc6666'

let g:NERDTreeExtensionHighlightColor['ex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['eex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['exs'] = 'cc6666'

let g:NERDTreeExtensionHighlightColor['haml'] = 'b5bd68'

noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>

" Exit if NERDTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree automatically on start but keep focus on mainwindow
" autocmd StdinReadPre * let s:std_in=1
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p

""" AirLine

let g:airline_powerline_fonts = 1
let g:airline_theme="gruvbox"

let airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#enabled = 1

""" Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
        \ 'haml' : ['ruby', 'rails', 'haml'],
        \ 'eruby' : ['ruby', 'rails']
        \ }


""" FZF
nnoremap <Leader>o :Files<CR>
nnoremap <C-p> :Files<CR>
inoremap <C-p> <ESC>:Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Commits<CR>
nnoremap <Leader>m :Maps<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <silent> <Leader>* :Ag <C-R><C-W><CR>
vnoremap <Leader>* y:Ag <C-r>=fnameescape(@")<CR><CR>


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'up': '~30%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--hidden --color-path "0;34" --color-line-number "0;31"', <bang>0)
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"Test
let test#strategy = "neoterm"

" function! RunTest(cmd)
"   call neoterm#open() " Opens the neoterm window
"   call neoterm#normal('G') " Scroll to the end of the neoterm window
"   exec a:cmd
" endfunction

nnoremap <silent> <leader>s :call RunTest('TestNearest')<CR>
nnoremap <silent> <leader>S :call RunTest('TestFile')<CR>
nnoremap <silent> <leader>a :call RunTest('TestSuite')<CR>
nnoremap <silent> <leader>l :call RunTest('TestLast')<CR>

nnoremap <silent> <leader>tq :Ttoggle<cr>
nnoremap <silent> <leader>to :Ttoggle<cr>

let g:neoterm_default_mod='botright'
let g:neoterm_size = '15'
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1

let g:dispatch_compilers = {'elixir': 'exunit'}

nnoremap <silent> <leader>s :TestNearest<CR>
nnoremap <silent> <leader>S :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>

" mundo

nnoremap <leader>g :MundoToggle<CR>

" incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" custom

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :Gwrite<CR>
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
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 150

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:startify_change_to_dir = 0

" Tmuxline

" let g:tmuxline_preset = {
"       \ 'a'    : ['#h', '#S'],
"       \ 'win'  : '#I #W',
"       \ 'cwin' : '#I #{?window_zoomed_flag,#[fg=red](,}#W#{?window_zoomed_flag,#[fg=red]),}',
"       \ 'y'    : ['%R', '%a'],
"       \ 'z'    : '#{battery_status_bg}#{battery_icon} #{battery_percentage}',
"       \ 'options': {
"       \   'status-justify': 'left',
"       \   'status-bg': 'colour234'}
"       \}
