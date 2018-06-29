" by Nervengift
" partly stolen from timo and various other sources
"
" external dependencies:
"
"   ack: grep alternative
"   rls: rust language server (rustup component add rls-preview rust-analysis rust-src)
"   racer: rust completer (cargo install racer)
"   pyls: python language server (pip install python-language-server)
"   task: taskwarrior, for taskwiki
"   python-tasklib: for taskwiki
"   a powerline-compatible font: for airline (statusbar)
"
" plugin installation:
"
"   VimPlug is used for plugin management. It is included in this dotfiles
"   repository and is available at https://github.com/junegunn/vim-plug
"
"   To download and install all plugins, just run :PlugInstall im vim
"

set nocompatible " don't be Vi.
set nomodeline " we got the securemodelines plugin for that


"  ____  _             _           
" |  _ \| |_   _  __ _(_)_ __  ___ 
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/             
" Plugins using VimPlug
call plug#begin('~/.vim/plugged')

" nerdtree: file browser sidebar
" bound to <leader>ls
Plug 'https://github.com/scrooloose/nerdtree.git'

" securemodelines: handle vim modelines more securely
Plug 'https://github.com/ciaranm/securemodelines.git'

" ctrlp: fuzzy file and buffer search with MRU
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" Git
Plug 'https://github.com/tpope/vim-fugitive.git'

" vim-qf: various tweaks for the quickfix window and location list
Plug 'https://github.com/romainl/vim-qf.git'

" async: needed by asyncronous plugins
Plug 'https://github.com/prabirshrestha/async.vim'

" ack: grep-like search
" usage:
"   :Ack <pattern> [<file>]
Plug 'https://github.com/mileszs/ack.vim.git'

" nerdcommenter: comment out code
" default bindings:
"   <leader>cc comment out current line/selected text
"   <leader>cs sexy comment: comment out lines with pretty block format
"   <leader>cu uncomment selection
Plug 'https://github.com/scrooloose/nerdcommenter.git'

" vim-unimpaired: set of handy pairwise mappings
" e.g.
"   [q :cnext
"   ]q :cprevious
"   [b :bprevious
"   ]b :bnext
"   [u ]u encode/decode url
"   [x ]x encode/decode xml/html
" there's lots of handy stuff in there that I should use more often, see
" https://github.com/tpope/vim-unimpaired/blob/master/README.markdownk
Plug 'https://github.com/tpope/vim-unimpaired.git'

" vim-surround: easy adding/changing quotes and parentheses
" e.g.:
"   cs"'  change surrounding " to '
"   ysiw) wrap current word (iw) in ()
"   ysiw( wrap current word (iw) with one space: ( foo )
"   ds)   remove ()
"   S<p> (in visual mode) surround selection with <p></p>
Plug 'https://github.com/tpope/vim-surround.git'

" vim-repeat: fix . for plugin mappings (at least in tpope plugins)
Plug 'https://github.com/tpope/vim-repeat.git' 

" use normal tab settings at beginning of line, expand tabs everywhere els
Plug 'https://github.com/dpc/vim-smarttabs.git'

" tagbar: sidebar for ctags (file structure)
" bound to <leader>tb
Plug 'https://github.com/majutsushi/tagbar.git'

" vim-lsp: Language server support for completion and refactoring
Plug 'https://github.com/prabirshrestha/vim-lsp'

" Vimwiki and taskwiki: for documentation and todo lists
Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/tbabej/taskwiki.git'

" vim-startify: start page with LRU files
Plug 'https://github.com/mhinz/vim-startify.git'

" auto-pairs: automatically insert closing brackets
" if it jumps to a closing bracket even if you wanted to type one, press <M-b>
Plug 'https://github.com/jiangmiao/auto-pairs.git'

" airline: statusbar
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" async completion
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
Plug 'https://github.com/keremc/asyncomplete-racer.vim.git'

" language support plugins
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/vim-scripts/openscad.vim'
Plug 'https://github.com/fatih/vim-go.git'
Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax.git'
Plug 'https://github.com/tclem/vim-arduino.git'
Plug 'https://github.com/chrisbra/csv.vim.git'
Plug 'https://github.com/cespare/vim-toml.git'
Plug 'https://github.com/lambdatoast/elm.vim.git'

" colorschemes
Plug 'https://github.com/nanotech/jellybeans.vim.git'

call plug#end()


"   ____                           _ 
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|
" 
" General options                                   

let mapleader=","
set encoding=utf-8 " UTF-8 is my default text encoding.
set autoindent " please indent for us!
set hidden
set wildmenu " zsh-like tab completion list menus, yay!
set wildmode=list:longest
set number
set backspace=indent,eol,start " make backspace behave nicely.
set splitright " splits open right of the existing window, not left

" indentation stuff. Should be replaced by some filetype stuff or something
set tabstop=4
set shiftwidth=4

" undo and swap files
set directory^=$HOME/.vim/swapfile//   "put all swap files together in one place
set undofile " create an undo file for persistent undo
set undodir^=$HOME/.vim/undofile//

" update after 500 miliseconds of no cursor movement, rather than
" 4 seconds (for taglist etc.)
set updatetime=500

" check if buffer is open in a window/tab before opening it in current tab
set switchbuf=usetab

" Command-line completion
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.pyc,*.pyo,.git,.hg,.svn,lib/**,.tox

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers
set nrformats=octal,hex

" Remember things between sessions
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,n~/.viminfo


"  _                _
" | |    ___   ___ | | __
" | |   / _ \ / _ \| |/ /
" | |__| (_) | (_) |   <
" |_____\___/ \___/|_|\_\
" 
" Look & feel

syn on

set t_Co=256
set background=dark
colorscheme jellybeans
if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://sunaku.github.io/vim-256color-bce.html
	set t_ut=
endif

set laststatus=2 " always display a status line for the last window
set relativenumber " display relative line numbers instead of absolute
set scrolloff=8 " if possible, don't move the cursor to within 8 lines of window edges
set linebreak " wrap lines on word boundaries

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" beautifully display tabs and trailing spaces
" set listchars=tab:¬\ ,trail:·
set listchars=tab:┃\ ,trail:·
set list

" Highlight current line - allows you to track cursor position more easily
set cursorline


"  ____                      _
" / ___|  ___  __ _ _ __ ___| |__
" \___ \ / _ \/ _` | '__/ __| '_ \
"  ___) |  __/ (_| | | | (__| | | |
" |____/ \___|\__,_|_|  \___|_| |_|
" 
" Search options

set smartcase " uppercase matches uppercase, lowercase matches any case
set gdefault " automatically replace globally. use /g at the end to turn off.
set incsearch " search while typing
set hlsearch " highlight search results
set showmatch " briefly jump to matching bracket pairs, if they are visible.
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" clear highlighted search
nnoremap <leader><space> :noh<cr>

" don't use vims own regex syntax.
nnoremap / /\v
vnoremap / /\v


"   ____                      _      _   _
"  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __
" | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \
" | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
"  \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
"                      |_|
" Completion popup configuration

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone
" Allow smarter completion by infering the case
set infercase


"  _  __
" | |/ /___ _   _ ___
" | ' // _ \ | | / __|
" | . \  __/ |_| \__ \
" |_|\_\___|\__, |___/
"           |___/
" Key mappings

" system wide copy-paste with ctrl-c ctrl-v
vmap <c-c> "+y
imap <c-v> "+p

" move screen lines rather than file lines in normal mode
nnoremap <down> gj
nnoremap <up> gk

" don't move the cursor in insert mode.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"
" leave insert mode with ctrl-d
imap <C-d> <Esc>

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>

" buffer list with F1. Who uses F1 for help anyway?
map <F1> :ls<enter>:b

" switch between .cpp and .h file (only works if in the same folder)
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR> 

" I always accidently hit :W instread of :w, so make both work
command! W write

" underline
nnoremap <leader>1 yypVr=o
nnoremap <leader>2 yypVr-o

" change current word's case without moving cursor
nnoremap <leader>~ m`lb~``
nnoremap <leader><leader>~ m`lbl~``

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Git stuff using fugitive
nnoremap <leader>gv :Gitv --all<cr>
nnoremap <leader>gV :Gitv! --all<cr>
vnoremap <leader>gV :Gitv! --all<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gw :w<cr>:Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gW :w<cr>:Gwrite<cr>:Gstatus<cr>
nnoremap <leader>ge :Gedit<cr>

" sudo write
ca w!! w !sudo tee % >/dev/null

" make tab completion behave as expected
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


"  _____ _ _        _
" |  ___(_) | ___  | |_ _   _ _ __   ___  ___
" | |_  | | |/ _ \ | __| | | | '_ \ / _ \/ __|
" |  _| | | |  __/ | |_| |_| | |_) |  __/\__ \
" |_|   |_|_|\___|  \__|\__, | .__/ \___||___/
"                       |___/|_|
" File type detection and rules

au BufRead,BufNewFile tmpmsg.* set filetype=mail
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" load vim-pandoc-syntax for all .md files
augroup pandoc_syntax
	au! BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
augroup END


"  ____  _             _                          __ _       
" |  _ \| |_   _  __ _(_)_ __     ___ ___  _ __  / _(_) __ _ 
" | |_) | | | | |/ _` | | '_ \   / __/ _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | (_| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \___\___/|_| |_|_| |_|\__, |
"                |___/                                 |___/ 
" Plugin-specific configuration options

" something for ctags or something.
let g:ctags_statusline=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_nr_show = 1

" nerdtree
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
" open the nerdtree with <leader>ls
nnoremap <leader>ls :NERDTreeToggle<cr>

" vimwiki
let g:vimwiki_list = [{'path' : '~/Seafile/sync/vimwiki/'}]

" tagbar
let g:tagbar_type_rust = {
	\ 'ctagstype' : 'rust',
	\ 'kinds' : [
		\'T:types,type definitions',
		\'f:functions,function definitions',
		\'g:enum,enumeration names',
		\'s:structure names',
		\'m:modules,module names',
		\'c:consts,static constants',
		\'t:traits,traits',
		\'i:impls,trait implementations',
	\]
	\}
" toggle tagbar on <leader>tb
nnoremap <leader>tb :TagbarToggle<cr>

" lsp (language server)
if executable('rls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'rls',
		\ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
		\ 'whitelist': ['rust'],
		\ })
endif
if executable('pyls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'pyls',
		\ 'cmd': {server_info->['pyls']},
		\ 'whitelist': ['python'],
		\ })
endif
" enable linter markers
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" mappings
nmap gd :LspDefinition<CR>
autocmd FileType rust nmap K :LspHover<CR>
autocmd FileType python nmap K :LspHover<CR>

" asyncomplete
autocmd User asyncomplete_setup call asyncomplete#register_source(
	\ asyncomplete#sources#racer#get_source_options())

" ctrlp
" search in files, MRU and buffers at once by default
let g:ctrlp_cmd = 'CtrlPMixed'


"   ____          _                                                                  _
"  / ___|   _ ___| |_ ___  _ __ ___     ___ ___  _ __ ___  _ __ ___   __ _ _ __   __| |___
" | |  | | | / __| __/ _ \| '_ ` _ \   / __/ _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` / __|
" | |__| |_| \__ \ || (_) | | | | | | | (_| (_) | | | | | | | | | | | (_| | | | | (_| \__ \
"  \____\__,_|___/\__\___/|_| |_| |_|  \___\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/
" 
" Custon functions and mappings

" Use scrot to insert a selectable region of the screen as image in markdown
" syntax. Screenshots are saved to the current file's directory
" usage: :InsertScreenshot <name>
function InsertScreenshot(name)
	" relative to file
	let relpath = a:name . ".png"
	" relative to current dir
	let path = expand('%:h') . "/" . relpath
	" absolute
	let fullpath = fnamemodify(path, ":p")
	let link = "![".a:name."](" . relpath . "){ width=50% }\\"
	execute "silent !scrot -s " . fullpath
	put =link
endfunction
command -nargs=1 InsertScreenshot call InsertScreenshot('<args>')
