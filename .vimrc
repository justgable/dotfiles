" Pathogen FTW!
call pathogen#infect()
call pathogen#helptags()

" Turn on syntax highlighting
syntax on

" Color scheme
set t_Co=256

if has('gui_running')
  colorscheme tommorow-night
else
  colorscheme litebrite
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
set modeline
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
  au BufRead,BufNewFile *.scss set filetype=css
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
let g:Powerline_symbols = 'fancy'

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
map <C-j> <C-D>
map <C-k> <C-U>

" Tab cycling
map <C-S-h> :tabprevious<CR>
map <C-S-l> :tabnext<CR>

" Buffer cycling
nmap <C-h> :bprevious<CR>
nmap <C-l> :bnext<CR>

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
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

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

" " Send the current line.
" nnoremap <leader>sel :call ScreenShellSend(getline("."))<cr>
" " Send the whole file (line by line)
" nnoremap <leader>sef :call ScreenShellSend(getline(1, "$"))<cr>
