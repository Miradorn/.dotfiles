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

" command line movement
cnoremap <C-p> <up>
cnoremap <C-n> <down>
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>

set encoding=utf-8
scriptencoding utf-8

set lazyredraw
set signcolumn=yes

if (has('termguicolors'))
  set termguicolors
endif

let mapleader = "\<Space>"

set inccommand=split

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
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set cursorline

" Cursor shape
" :set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"       \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"       \,sm:block-blinkwait175-blinkoff150-blinkon175

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

" set foldcolumn=3
set foldmethod=syntax
set foldlevelstart=20

""" Dein
let g:dein#install_log_filename = '~/.dein.log'
" let g:dein#install_progress_type = 'tabline' " else maybe tabline
let g:dein#enable_notification = 1

""" Plugins

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim/" path to dein.vim

if dein#load_state(expand('~/.vim/dein')) " plugins' root path
  call dein#begin(expand('~/.vim/dein')) " plugins' root path

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim/')

  " Languages
  call dein#add('sheerun/vim-polyglot')
  call dein#add('towolf/vim-helm')

  " Compile/Test
  call dein#add('vim-test/vim-test')
  call dein#add('kassio/neoterm')

  " NerdTree
  call dein#add('scrooloose/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

  " Ruby
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-bundler')

  """ Completions
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  call dein#add('honza/vim-snippets')
  call dein#add('liuchengxu/vista.vim')
  call dein#add('antoinemadec/coc-fzf')


  " HTML
  call dein#add('mattn/emmet-vim')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('shumphrey/fugitive-gitlab.vim')
  " call dein#add('airblade/vim-gitgutter')

  " visual undo tree
  call dein#add('mbbill/undotree')

  " movement
  call dein#add('justinmk/vim-sneak')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('wellle/targets.vim')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('dhruvasagar/vim-zoom')

  " colors
  call dein#add('chriskempson/base16-vim')
  call dein#add('jacoborus/tender.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('joshdick/onedark.vim')
  call dein#add('arcticicestudio/nord-vim')

  " other

  call dein#add('tpope/vim-projectionist')
  call dein#add('tpope/vim-eunuch')

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

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('dense-analysis/ale')
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

syntax enable
filetype plugin indent on    " required

set background=dark

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

colorscheme nord

" ALE Linter/formatter
let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 1
let g:ale_virtualtext_cursor = 1

" use nice symbols for errors and warnings
let g:ale_sign_highlight_linenrs = 1
" let g:ale_change_sign_column_color = 1
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'

let g:ale_linters = {}
let g:ale_linters.ruby = ['brakeman', 'rails_best_practices', 'reek']
let g:ale_linters.markdown = []
let g:ale_linters.graphql = ['gqlint']
let g:ale_linters.javascript = []
let g:ale_linters.typescriptreact = []
let g:ale_linters.typescript = []
let g:ale_linters.scss = []
let g:ale_linters.css = []
let g:ale_linters.elixir = ['credo', 'mix']
let g:ale_linters.terraform = ['terraform', 'tflint']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
" let g:ale_fixers.javascript = ['prettier']
" let g:ale_fixers.typescript = ['prettier']
" let g:ale_fixers.scss = ['stylelint']
" let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
" let g:ale_fixers.ruby = ['rubocop']
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fixers.terraform = ['terraform']
let g:ale_fixers.tf = ['terraform']
let g:ale_fixers.hcl = ['terraform']
" let g:ale_fixers.vue = ['eslint']
" let g:ale_fixers.json = ['prettier']

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_elixir_credo_strict = 1
" let g:ale_elixir_elixir_ls_release = expand('~') . '/projects/elixir-ls/rel'
" let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

nnoremap <leader>fa :ALEFix<CR>

nnoremap <leader>ff :call CocAction('format')<CR>

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

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
let g:NERDTreeExtensionHighlightColor['leex'] = 'cc6666'
let g:NERDTreeExtensionHighlightColor['exs'] = 'cc6666'

let g:NERDTreeExtensionHighlightColor['haml'] = 'b5bd68'

noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>

" Exit if NERDTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" AirLine

let g:airline_powerline_fonts = 1
let g:airline_theme="nord"

" let airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#coc_git = 1

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
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>m :Maps<CR>
nnoremap <silent> <Leader>* :Ag <C-R><C-W><CR>
vnoremap <Leader>* y:Ag <C-r>=fnameescape(@")<CR><CR>


let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 25, 'yoffset': 0.03, 'border': 'rounded' } }

let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--hidden --color-path "0;34" --color-line-number "0;31"', <bang>0)
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Vista

let g:vista_default_executive = 'coc'

let g:vista#renderer#enable_icon = 1

nnoremap <Leader>tt :Vista!!<CR>
nnoremap <Leader>tf :Vista finder<CR>

let g:vista_sidebar_width = 50
let g:vista_echo_cursor = 1
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_fzf_preview = ['right:50%']

" Test
let test#strategy = "neoterm"

nnoremap <silent> <leader>tq :Ttoggle<cr>
nnoremap <silent> <leader>to :Ttoggle<cr>

let g:neoterm_default_mod='botright'
let g:neoterm_size = '20'
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1

let g:dispatch_compilers = {'elixir': 'exunit'}

let g:test#javascript#jest#file_pattern = '\v(tests?/.*|(test))\.(js|jsx|coffee|tsx?)'
let g:test#javascript#jest#executable = 'yarn test'

nnoremap <silent> <leader>s :TestNearest<CR>
nnoremap <silent> <leader>S :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>

" undo tree

nnoremap <leader>g :UndotreeToggle<CR>

" incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" git
" let g:fugitive_gitlab_domains = ['https://gitlab.akra.de']

" custom
iabbrev <// </<C-X><C-O>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ec :CocConfig<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>ed :vsplit ~/.dein.log<cr>
nnoremap <leader>ek :vsplit ~/.config/kitty/kitty.conf<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :Gwrite<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
map q: :q
nnoremap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

onoremap p i(

nnoremap <CR> G
nnoremap <BS> gg

nmap <leader>z <Plug>(zoom-toggle)

" jump to next closing pair
let g:AutoPairsShortcutJump = '<C-]>'

" move by screen line
nnoremap j gj
nnoremap k gk

" move lines/block linewise up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

if has("nvim")
  " For terminal mode
  tnoremap <Esc> <C-\><C-n>
end

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
highlight HighlightedyankRegion cterm=reverse gui=reverse
highlight CocHighlightText cterm=undercurl,italic gui=undercurl,italic

highlight Comment guifg=#b48ead


" let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" =================
" COC
" =================

nnoremap <Leader>cu :CocUpdate<CR>

let g:coc_global_extensions = [
      \"coc-css",
      \"coc-sh",
      \"coc-markdownlint",
      \"coc-go",
      \"coc-git",
      \"coc-elixir",
      \"coc-eslint",
      \"coc-highlight",
      \"coc-html",
      \"coc-json",
      \"coc-prettier",
      \"coc-rls",
      \"coc-snippets",
      \"coc-solargraph",
      \"coc-stylelintplus",
      \"coc-tsserver",
      \"coc-vetur",
      \"coc-vimlsp",
      \"coc-yank",
      \"coc-yaml"
      \]

inoremap <C-c> <ESC>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:coc_snippet_next = '<C-j>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> <leader>ca <Plug>(coc-codeaction-line)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [[ <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> ]] :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> <A-[> :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> H :call CocActionAsync('highlight')<cr>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" let g:coc_fzf_preview = ''
" let g:coc_fzf_opts = []

nnoremap <silent> <leader>cl  :<C-u>CocFzfList<cr>
nnoremap <silent> <leader>cc  :<C-u>CocFzfList commands<cr>
nnoremap <silent> <leader>cy  :<C-u>CocFzfList yank<cr>
nnoremap <silent> <leader>ce  :<C-u>CocFzfList extensions<cr>
nnoremap <silent> <leader>co  :<C-u>CocFzfList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocFzfList symbols<cr>

""""""""
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:startify_change_to_dir = 0

augroup filetypedetect
  au! BufNewFile,BufRead *.template set ft=yaml
augroup END

" tmuxline
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
