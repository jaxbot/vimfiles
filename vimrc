" It's not the 80s anymore, yo. We're 90s kids.
set nocompatible

set encoding=utf-8

" Look
set background=dark 
colorscheme jellybeans
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h10

" line numbers
set number			
" relative line numbers
set rnu
" no menus, scrollbars, or other junk
set guioptions=

" make backspace delete characters
set backspace=2

" I like my leader being ','. It's easier to reach
let mapleader = ","

" Disable chimes
set visualbell
set t_vb = 
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" disable backup and swap files
set nobackup
set noswapfile

" use the OS clipboard
set clipboard=unnamed

" Improve Unix/Windows compatibility
set viewoptions=folds,options,cursor,unix,slash
" allow the cursor to pass the last character
set virtualedit=onemore             " Cursor goes beyond last character
" store more command history
set history=100						" Store more history (default is 20)
" store a bunch of undo history
set undolevels=400
" enable spell checking
set spell
" allow buffer switching without saving
set hidden

" Status line
set laststatus=2
" Filename
set statusline=%<%f\
" Options
set statusline+=%w%h%m%r                 
" Git Hotness
set statusline+=%{fugitive#statusline()}
" Filetype
set statusline+=\ [%{&ff}/%Y]
" Directory
set statusline+=\ [%{getcwd()}]
" File info
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

" Show matching brackets/parenthesis
set showmatch
" Don't blink
set matchtime=0
" Find as you type search
set incsearch
" Highlight search terms
set hlsearch
" Windows can be 0 line high
set winminheight=0
" Case insensitive search
set ignorecase
" Case sensitive if we type an uppercase
set smartcase

" CTRL-S
nnoremap <silent> <C-S> :<C-u>Update<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Window navigation
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Use Esc to hide search highlights
nnoremap <Esc> :nohl<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
	
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Indent options
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set cinkeys=0{,0},:,0#,!^F

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Pathogen enabled bundle folder
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" These must be after pathogen loads
syntax on
filetype on 
filetype plugin on
filetype plugin indent on

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Nodejs dictionary
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict

" Netrw remote transfers
let g:netrw_silent = 1

if has("win32")
	let g:netrw_scp_cmd = "pscp.exe"
endif

" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && %:r<CR>

" java compile files
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % && java %:r<CR>

" Fugitive/Git Shortcuts 
nnoremap <leader>g :Gstatus<CR>4j
autocmd filetype gitcommit nnoremap <buffer> c :Gcommit<CR>

" Ag, the silver searcher
map <C-\> :execute "Ag " . expand("<cword>") <CR>

" Brolink
let g:bl_autostart = 1
au BufWritePost */static/templates/*.html :BLReloadTemplate

hi CursorLineNr   term=bold ctermfg=Gray gui=bold guifg=#c5c5c5

" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Neocomplete
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" No scratch
set completeopt-=preview

" Full screen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
map <F12> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230)<CR>

" Use powerline fonts on airline
let g:airline_powerline_fonts = 1

" lets start in my www folder
cd ~/www

