"source $ADMIN_SCRIPTS/master.vimrc
"source $ADMIN_SCRIPTS/vim/biggrep.vim

" Of course
set nocompatible

" Turn things on.  We need to run `filetype off` first because vim defaults
" to `filetype on`, and unless we toggle it, our custom filetype detections
" won't be run.
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" run :PluginInstall to install once Vundle is configured
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle
Plugin 'reidHoruff/tagless'
Plugin 'bling/vim-airline'
Plugin 'wincent/command-t'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
"Plugin 'ihacklog/HiCursorWords'
Plugin 'octol/vim-cpp-enhanced-highlight'
" cursor shape change, mouse support, focus reporting, bracketed paste, etc
Plugin 'wincent/terminus'
"Plugin 'henrik/vim-indexed-search'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()

filetype indent plugin on
syntax enable

set background=dark
set t_Co=256  " 256 term coloring
colorscheme solarized

" Display.
set ruler           " show cursor position
set showcmd         " show normal mode commands as they are entered
set showmode        " show editing mode in status (-- INSERT --)
set showmatch       " flash matching delimiters

" Scrolling.
"set scrolljump=5    " scroll five lines at a time vertically
set sidescroll=10   " minumum columns to scroll horizontally
set scrolloff=8    " start scrolling 15 from bott

" Indent.
set autoindent      " carry indent over to new lines

" Other.
set noerrorbells      " no bells in terminal

set backspace=indent,eol,start  " backspace over everything

set undolevels=1000   " number of undos stored
set viminfo='50,"50   " '=marks for x files, "=registers for x files

set modelines=0       " modelines are bad for your health

"remember cursor position
set nosol

" recursively search parent directories until tag file found
set tags=tags;/
set iskeyword=@,45,48-57,58,_,192-255,#

"set background=dark

" Set Line numbers on
set number
set relativenumber

" Move to next displayed line instead of actual line
nnoremap j gj
nnoremap k gk

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime 

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Keep undo history across sessions, by storing in file. This never works
"set undodir=~/.vim/backups
"set undofile

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" highlight current line curosr is on
set cursorline

" cursor fat to skinny on insert
"if exists('$TMUX')
    "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

" ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" let copy and paste work with yy, D, P, etc
" set clipboard=unnamed


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Line text past 80 char
set textwidth=80
set colorcolumn=81 " absolute columns to highlight "
set colorcolumn=+1 " relative (to textwidth) columns to highlight "
:highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Tabs Settings
set shiftwidth=2    " two spaces per indent
set tabstop=2       " number of spaces per tab in display
set softtabstop=2   " number of spaces per tab when inserting
set expandtab       " substitute spaces for tabs

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw 
set ttyfast

" Don't get rid of buffers when changing files, used with minibufexpl 
set hidden

" Autocompletion for buffer usingn tab
set wildmenu
set wildmode=longest:full,full
set wildignorecase

" Buffer settings, use gb to jump to buffer list
noremap gb :ls<CR>:b<Space>

" buffer settings, next previous delete
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr> 

" Toggle NerdTree on and off
nmap <silent> <F3> :NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1

" Get Smooth Scrolling to work - requires vim-smooth-scroll plugin
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 40, 4)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 40, 4)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 40, 8)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 40, 8)<CR>

" indentline stuff - requires indentline plugin
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

" command-t settings for FB
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 500000
let g:CommandTInputDebounce = 200
let g:CommandTFileScanner = 'watchman'
let g:CommandTMaxCachedDirectories = 10
let g:CommandTSmartCase = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Show buffer numbers in airline
let g:airline#extensions#tabline#buffer_nr_show = 1

" Powerline fonts on
let g:airline_powerline_fonts = 1

" Airline theme
let g:airline_theme='solarized'

"number of context lines to display
let g:tagless_context_lines=0

"highlight the current string being grepped for in results
let g:tagless_highlight_result=1

"height of the preview window which contains the grep results
let g:tagless_window_height=30

"set syntax based on the current buffer - it's shitty
let g:tagless_enable_shitty_syntax_highlighting=1

"infer what files to grep through based on current buffer
let g:tagless_infer_file_types=1

" vim - notes directory
let g:notes_directories = ['~/notes']
let g:notes_conceal_url = 0
let g:notes_conceal_italic = 0
let g:notes_smart_quotes = 0
let g:notes_conceal_code = 0

" disable insert cursor change from Terminus Plugin
let g:TerminusCursorShape = 0


" toggle tagbar plugin
nmap <leader>g :TagbarToggle<CR>

" Ctrlp
"nmap <leader>t :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>r :CtrlPMRU<CR>
let g:ctrlp_max_files = 300000
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:25,results:25'
let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_lazy_update = 180

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Configuration for ~/.vimrc:
" Bind <leader>y to forward last-yanked text to Clipper
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

"grep for current word under cursor - its the only command
map gf :TaglessCW<CR>

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

" FB specific stuff
" Treat *.test files as sql to get better syntax highlighting
"au BufReadPost *.test set syntax=sql

