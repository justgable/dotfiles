set nocompatible
filetype on
filetype off

"=============================================================================
"
"  PLUGINS
"
"=============================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" -Utilities
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/screen'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/tlib'
Plugin 'tomtom/tlib_vim.git'
Plugin 'zaiste/tmux.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'bling/vim-airline'
Plugin 'roblillack/vim-bufferlist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/vitality.vim'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'

" -Syntax & Language
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5-syntax.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'lumiliet/vim-twig'
Plugin 'Glench/Vim-Jinja2-Syntax'
" Plugin 'chrisbra/Colorizer'
Plugin 'https://git.drupal.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}
Plugin 'digitaltoad/vim-pug'
Plugin 'w0ng/vim-hybrid'
Plugin 'posva/vim-vue'

" Plugin 'garbas/vim-snipmate'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'sekel/vim-vue-syntastic'

" -Color
Plugin 'sjl/badwolf'
Plugin 'godlygeek/csapprox'
Plugin 'vim-scripts/ScrollColors'
Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-vividchalk'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

" END Vundle

"=============================================================================
"
"  COLORSCHEMES & SYNTAX
"
"=============================================================================

" Turn on syntax highlighting
syntax on

" Color schemes
set t_Co=256
if has('gui_running')
  set background=dark
  colorscheme gruvbox
elseif has('nvim') 
  " Disable if using iTerm reduced contrast colors
  " See https://github.com/w0ng/vim-hybrid#osx-users-iterm
  let g:hybrid_reduced_contrast = 1
  let g:hybrid_custom_term_colors = 1
  set background=dark
  
  " Only works well with certain colorschemes like gruvbox
  set termguicolors
  colorscheme hybrid

else
  colorscheme badwolf
endif

if has("autocmd")

  " Check to see if filetype was automagically identified by Vim
  if exists("did_load_filetype")
    finish
  else
    augroup filetypedetect
      au! BufRead,BufNewFile *.m setfiletype objc
    augroup end
  endif

  " Alternate syntax highlights and indentation
  au BufRead,BufNewFile *.vue set filetype=vue syntax=html
  au BufRead,BufNewFile *.njk set filetype=jinja
  au BufRead,BufNewFile *.scss set filetype=sass
  au FileType c,cpp,objc set tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.theme,*.module,*.install,*.test,*.inc,*.view 
        \ set filetype=php

endif

"=============================================================================
"
"  GENERAL SETTINGS
"
"=============================================================================

" Turn on number lines
set number

" Enable filetypes
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

" Set tab/indention settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set expandtab

set listchars=tab:▸\ ,eol:¬

" Minimum window width/height
set winwidth=84
set winheight=24

"Show line and column info
set ruler

"Show 80 character line
set colorcolumn=80

" Turn on Omni completion
set omnifunc=syntaxcomplete#Complete

" Look for and call vim commands within first 5 lines of a doc
" set modeline
set modelines=5

set wildmenu
set wildmode=longest,list

set cursorline

" Copy to system clipboard
" set clipboard=unnamed

let mapleader=","

" Fixes lines with odd number of indents
set shiftround

" Case insensitive search
set ignorecase
set smartcase

" Session settings
set sessionoptions=resize,winpos,winsize,curdir

" Turn on code folding
set foldenable

" To show status bar
set laststatus=2

" Turn off toolbars
if has("gui_running")
	set guioptions=aiA
endif 

"=============================================================================
"
"  KEY BINDS
"
"=============================================================================

" Saves time; maps the spacebar to colon
nmap <space> :

" Omni completion
imap <C-space> <C-X><C-O>

" Map escape key to jj
imap jj <esc>

" Remap pageup / pagedown
" map <C-j> <C-D>
" map <C-k> <C-U>

" Split navigation
" NOTE: If using NeoVim see URL below for <C-h> bind issues
" https://github.com/neovim/neovim/issues/2048#issuecomment-98307896
nmap <C-h> <C-W><C-H>
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>

" Tab cycling
" nmap <C-S-h> :tabprevious<CR>
" nmap <C-S-l> :tabnext<CR>

" Buffer cycling
nmap <A-S-h> :bprevious<CR>
nmap <A-S-l> :bnext<CR>

" Allow to Tab and S-Tab on highlighted text
vnoremap <tab> >`<V`>
vnoremap <s-tab> <`<V`>

" Stop that stupid window from popping up 
" @URL (http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
map q: :q

"=============================================================================
"
"  PLUGIN SETTINGS
"
"=============================================================================

" avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

" Syntastic settings (recommended)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" " php settings
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=Drupal"

" Airline settings
let g:airline_symbols = {}
let g:airline_powerline_fonts=1
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.paste = 'ρ'

" Allow gruvbox theme to use italics
let g:gruvbox_italic=1

" Ag settings
nmap <C-g> :Ag<CR>

" fzf settings
set rtp+=/usr/local/opt/fzf
nmap ; :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>r :Buffers<CR>

" Full screen view of fzf
" let g:fzf_layout = { 'window': 'enew' }

" ctrlp settings
" TODO: eventually drop ctrlp for fzf.vim
" let g:ctrlp_map = ';'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|tmp|[\/](node_modules|target|dist|config_)'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" use Git project for autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

" vim-jsx
let g:jsx_ext_required = 0

" Vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" vim-javascript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" XDebug settings
let g:vdebug_options = {
      \    "ide_key" : 'VIM',
      \}

let g:vdebug_options['path_maps'] = {
      \ '/var/www/parenttheme/web' : '/Users/justin.gable/Sites/parenttheme/web',
      \ '/var/www/d8-news/docroot' : '/Users/justin.gable/Sites/d8-news/docroot'
      \}

" Use the compact window layout. 
let g:vdebug_options['watch_window_style'] = 'compact'

" Set keybindings
let g:vdebug_keymap = { 
      \ "run" : "<Leader>/", 
      \ "run_to_cursor" : "<Down>", 
      \ "step_over" : "<Up>", 
      \ "step_into" : "<Right>", 
      \ "step_out" : "<Left>", 
      \ "close" : "q", 
      \ "detach" : "<F7>", 
      \ "set_breakpoint" : "<Leader>s", 
      \ "eval_visual" : "<Leader>e" 
      \}

