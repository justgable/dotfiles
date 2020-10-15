set nocompatible
filetype on

"=============================================================================
"
"  PLUGINS
"
"=============================================================================

" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')

" -Utilities
Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/matchit'
Plug 'ervandew/screen'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'zaiste/tmux.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bling/vim-airline'
Plug 'roblillack/vim-bufferlist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'sjl/vitality.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'joonty/vdebug'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter'

" -Syntax & Language
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'othree/html5-syntax.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'lumiliet/vim-twig'
Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'chrisbra/Colorizer'
Plug 'https://git.drupal.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}
Plug 'digitaltoad/vim-pug'
Plug 'w0ng/vim-hybrid'
Plug 'posva/vim-vue'
" Plug 'scrooloose/syntastic'
" Plug 'sekel/vim-vue-syntastic'
Plug 'w0rp/ale'
Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'

" -Color
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sjl/badwolf'
Plug 'godlygeek/csapprox'
Plug 'vim-scripts/ScrollColors'
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/powerline-fonts'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-vividchalk'
Plug 'altercation/vim-colors-solarized'

call plug#end()

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
  " let g:hybrid_reduced_contrast = 1
  " let g:hybrid_custom_term_colors = 1
  
  " Only works well with certain colorschemes like gruvbox
  set termguicolors
  colorscheme dracula
  set background=dark
  " Sets bg to transparent to use terminal background color
  hi Normal guibg=NONE ctermbg=NONE

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
  au BufRead,BufNewFile *.scss,*.css set filetype=sass
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

" Set update time from default 4000ms
set updatetime=100

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
" ALE settings
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" emmet-vim
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" vim-prettier
" " disable error window
" let g:prettier#quickfix_enabled = 0

" " Running before saving sync
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
"
" Make vim-prettier work like default prettier
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#jsx_bracket_same_line = 'false'
" let g:prettier#config#arrow_parens = 'avoid'
" let g:prettier#config#trailing_comma = 'none'
" let g:prettier#config#parser = 'babylon'

" GitGutter https://github.com/airblade/vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_grep = 'ag'

" avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

" Syntastic settings (recommended)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" " " php settings
" let g:syntastic_php_checkers = ['php', 'phpcs']
" let g:syntastic_php_phpcs_args = "--standard=Drupal"

" Airline settings
let g:airline_symbols = {}
let g:airline_powerline_fonts=0
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.paste = 'ρ'
" let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_y = ''
let g:airline_section_z = ''

" Allow gruvbox theme to use italics
let g:gruvbox_italic=1

" Rg settings
nmap <C-g> :Find<CR>
" :Find use rg; pulled from https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!bower_components/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" fzf settings
set rtp+=/usr/local/opt/fzf
nmap ; :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>r :Buffers<CR>

" set grepprg=rg\ --vimgrep\ --no-messages\ --ignore\ --glob "!node_modules"\ --glob "!bower_components"

" vim-jsx
let g:jsx_ext_required = 0

" Vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.jsx'

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

