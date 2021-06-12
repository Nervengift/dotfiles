
" Rust setup:
" rustup component add rustfmt
" rustup component add clippy
" git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
" cargo xtask install --server

call plug#begin()
Plug 'neovim/nvim-lspconfig'

" tab completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
" lsp snippet support
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" vsnip loads snippets from vscode extensions
Plug 'polypus74/trusty_rusty_snippets'

" autoformat
Plug 'Chiel92/vim-autoformat'

" outline sidebar, tagbar replacement
" bound to <leader>tb
Plug 'liuchengxu/vista.vim'

" nerdtree: file browser sidebar
" bound to <leader>ls
Plug 'https://github.com/scrooloose/nerdtree.git'

" vim-startify: start page with LRU files
Plug 'https://github.com/mhinz/vim-startify.git'

" Vimwiki and taskwiki: for documentation and todo lists
Plug 'https://github.com/vimwiki/vimwiki.git'
"Plug 'https://github.com/tbabej/taskwiki.git'
"
" airline: statusbar
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" colorschemes
Plug 'https://github.com/nanotech/jellybeans.vim.git'

" ctrlp: fuzzy file and buffer search with MRU
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" Git
Plug 'https://github.com/tpope/vim-fugitive.git'

" vim-qf: various tweaks for the quickfix window and location list
Plug 'https://github.com/romainl/vim-qf.git'

" nerdcommenter: comment out code
" default bindings:
"   <leader>cc comment out current line/selected text
"   <leader>cs sexy comment: comment out lines with pretty block format
"   <leader>cu uncomment selection
Plug 'https://github.com/scrooloose/nerdcommenter.git'

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

" auto-pairs: automatically insert closing brackets
" if it jumps to a closing bracket even if you wanted to type one, press <M-b>
Plug 'https://github.com/jiangmiao/auto-pairs.git'


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
set directory^=$HOME/.cache/nvim/swapfile//   "put all swap files together in one place
set undofile " create an undo file for persistent undo
set undodir^=$HOME/.cache/nvim/undofile//

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
set viminfo='20,\"50,:20,/20,n~/.cache/nviminfo


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
" transparent background
hi Normal guibg=NONE ctermbg=NONE
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

" setup rust_analyzer LSP (IDE features)
lua require'lspconfig'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1

" customise deoplete
" maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

"TODO: clippy on write
autocmd BufWrite * :Autoformat

autocmd Filetype rust nnoremap <leader>c :!cargo clippy
autocmd Filetype rust command! Run execute "!cargo run"
autocmd Filetype rust command! Rrun execute "!cargo run --release"
autocmd Filetype rust command! Build execute "!cargo build"
autocmd Filetype rust command! Rbuild execute "!cargo build --release"
autocmd Filetype rust command! Test execute "!cargo test"

" map common editor commands via lsp
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" make tab completion behave as expected
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
"imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" rename using lsp
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
" TODO: go to definition, hover


"  _  __
" | |/ /___ _   _ ___
" | ' // _ \ | | / __|
" | . \  __/ |_| \__ \
" |_|\_\___|\__, |___/
"           |___/
" Key mappings

" system wide copy-paste with ctrl-c ctrl-v
vmap <c-c> "+y
imap <c-v> <C-O>"+p

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
let NERDTreeQuitOnOpen=1
" close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open the nerdtree with <leader>ls
nnoremap <leader>ls :NERDTreeToggle<cr>

" vimwiki
let g:vimwiki_list = [{'path' : '~/Seafile/sync/vimwiki/'}]

" toggle tagbar on <leader>tb
nnoremap <leader>tb :Vista!!<cr>
"
" sidebar (vista) options
let g:vista_close_on_jump=1
let g:vista_default_executive='ctags'
let g:vista_executive_for = {
			\ 'rust': 'nvim_lsp',
			\ }
" TODO: icon font
let g:vista#renderer#enable_icon = 0


" ctrlp
" search in files, MRU and buffers at once by default
let g:ctrlp_cmd = 'CtrlPMixed'


