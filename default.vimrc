set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" -Utilities
Plugin 'git://github.com/kien/ctrlp.vim'
Plugin 'git://github.com/tmhedberg/matchit'
Plugin 'git://github.com/scrooloose/nerdtree'
Plugin 'git://github.com/ervandew/screen'
Plugin 'git://github.com/godlygeek/tabular'
Plugin 'git://github.com/tomtom/tcomment_vim'
Plugin 'git://github.com/vim-scripts/tlib'
Plugin 'git://github.com/tomtom/tlib_vim.git'
Plugin 'git://github.com/zaiste/tmux.vim'
Plugin 'git://github.com/MarcWeber/vim-addon-mw-utils'
Plugin 'git://github.com/bling/vim-airline'
Plugin 'git://github.com/roblillack/vim-bufferlist'
Plugin 'git://github.com/tpope/vim-repeat'
Plugin 'git://github.com/tpope/vim-surround'

" -Syntax & Language
Plugin 'git://github.com/othree/html5-syntax.vim'
Plugin 'git://github.com/cakebaker/scss-syntax.vim'
Plugin 'git://github.com/mxw/vim-jsx'
Plugin 'git://github.com/tpope/vim-rails'
Plugin 'git://github.com/qbbr/vim-twig'
Plugin 'git://github.com/garbas/vim-snipmate'

" -Color
" Plugin 'git://github.com/godlygeek/csapprox'
Plugin 'git://github.com/vim-scripts/ScrollColors'
Plugin 'git://github.com/morhetz/gruvbox'
Plugin 'git://github.com/Lokaltog/powerline-fonts'
Plugin 'git://github.com/flazz/vim-colorschemes'
Plugin 'git://github.com/tpope/vim-vividchalk'

call vundle#end()
filetype plugin indent on

" END Vundle

" Turn on syntax highlighting
syntax on

" Use OSX clipboard (Does not work in Mountain Lion)
" set clipboard=unnamed

" Color scheme
set t_Co=256

if has('gui_running')
  colorscheme molokai
else
  " colorscheme litebrite
  " colorscheme lucius
  " colorscheme nerv-ous
  colorscheme night_vision
  " colorscheme no_quarter
  " colorscheme vividchalk
endif

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

" Look for and call vim commands within first 5 lines of a doc
" set modeline
set modelines=5

set wildmenu
set wildmode=longest,list

set cursorline

let mapleader=","

" Fixes lines with odd number of indents
set shiftround

" Allow to Tab and S-Tab on highlighted text
vnoremap <tab> >`<V`>
vnoremap <s-tab> <`<V`>

" Prevent Vim from destroying scrollback buffer
" See: http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=

" To show status bar
set laststatus=2

if has("autocmd")
  " Source the .vimrc file after saving it
  " autocmd bufwritepost .vimrc source $MYVIMRC

  " Check to see if filetype was automagically identified by Vim
  if exists("did_load_filetype")
    finish
  else
    augroup filetypedetect
      au! BufRead,BufNewFile *.m setfiletype objc
    augroup end
  endif

  " Alternate syntax highlights and indentation
  au BufRead,BufNewFile *.scss set filetype=sass
  au FileType c,cpp,objc set tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.module,*.install,*.test,*.inc,*.view set filetype=php

endif

if has("gui_macvim")
  let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
  let g:clang_complete_auto = 1
  set omnifunc=ClangComplete
  let g:clang_user_options='clang -cc1 -triple i386-apple-macosx10.6.7 -target-cpu yonah -target-linker-version 128.2 -resource-dir /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/3.1 -fblocks -x objective-c -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk -D __IPHONE_OS_VERSION_MIN_REQUIRED=50100 || exit 0'
endif

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Powerline settings - use cool icons
" let g:Powerline_symbols = 'fancy'

" Airline settings
" let g:airline_enable_syntastic=1
let g:airline_symbols = {}
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␤ '
" let g:airline_fugitive_prefix = '⎇ '
let g:airline_symbols.paste = 'ρ'

" vim-jsx syntax
let g:jsx_ext_required = 0

" Case insensitive search
set ignorecase
set smartcase

" Session settings
set sessionoptions=resize,winpos,winsize,curdir

" Saves time; maps the spacebar to colon
nmap <space> :

" Map escape key to jj
imap jj <esc>

" Remap pageup / pagedown
" map <C-j> <C-D>
" map <C-k> <C-U>

" Split navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Tab cycling
" map <C-S-h> :tabprevious<CR>
" map <C-S-l> :tabnext<CR>

" Buffer cycling
" nmap <C-h> :bprevious<CR>
" nmap <C-l> :bnext<CR>
nmap <A-S-h> :bprevious<CR>
nmap <A-S-l> :bnext<CR>

" For autocompletion
set wildmode=list:longest

" Turn on code folding
set foldenable

" Turn off toolbars
if has("gui_running")
	set guioptions=aiA
endif 

" ctrlp settings
let g:ctrlp_map = ';'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|tmp'
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

" for copy paste with mouse
" set mouse=r

" Set shortcut for BufferList plugin
" nmap 9 :call BufferList()<CR>

" NERDTree shortcut
" nmap 3 :NERDTreeToggle<CR>

" NERDTree show hidden files
" let NERDTreeShowHidden=1

" avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0  

" filetypes for YouCompleteMe to ignore
" let g:ycm_filetypes_to_completely_ignore = {
"       \ 'notes' : 1,
"       \ 'markdown' : 1,
"       \ 'text' : 1,
"       \ 'html' : 1,
"       \}

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0

" map <F5> :ScreenShellVertical<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

" Joel's suggested screen settings
nnoremap <leader>ssv :ScreenShellVertical<cr>
nnoremap <leader>ssr :ScreenShellReopen<cr>
nnoremap <leader>ssq :ScreenQuit<cr>
nnoremap <leader>sss :ScreenSend<cr>

" Send the current line.
nnoremap <leader>ssl :call ScreenShellSend(getline("."))<cr>
" Send the whole file (line by line)
nnoremap <leader>ssf :call ScreenShellSend(getline(1, "$"))<cr>

" Stop that stupid window from popping up (http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
map q: :q

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
