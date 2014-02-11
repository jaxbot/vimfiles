" It's not the 80s anymore, yo. We're 90s kids.
set nocompatible

set encoding=utf-8

" Look
set background=dark 
colorscheme jellybeans
set guifont=Source\ Code\ Pro:h11

set number			" line numbers
set rnu				" relative line numbers
set guioptions=		" turn off menus, scrollbars, etc
set backspace=2		" make backspace delete characters

let mapleader = ","

" Disable chimes
set visualbell
set t_vb = 
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" sick of those swp/backup files
set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.
set nobackup " DIE FOUL BEAST
set noswapfile

set clipboard=unnamed

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

set virtualedit=onemore             " Cursor goes beyond last character
set history=100						" Store more history (default is 20)
set undolevels=400					" All the undo
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set cursorline                  	" Highlight current line

" Statusline
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set showmatch                   " Show matching brackets/parenthesis
set matchtime=0					" Don't blink
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive if we type an uppercase

" CTRL-S
nnoremap <silent> <C-S> :<C-u>Update<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

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
set cinkeys=0{,0},:,0#,!^F

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

" Powerline: use ASCII characters instead of unicode
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols_override = {
        \ 'BRANCH': '|',
        \ 'LINE': 'LN',
        \ }

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Nodejs dictionary
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict

" Netrw remote transfers
let g:netrw_silent = 1
let g:netrw_scp_cmd = "pscp.exe"

" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && %:r<CR>

" java compile files
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % && java %:r<CR>

" Shortcuts 
nnoremap <leader>g :Gstatus<CR>

" Ag, the silver searcher
map <C-\> :execute "Ag " . expand("<cword>") <CR>

" lets start in my www folder
cd ~/www

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

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
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

" Turn off vimchat logs
let g:vimchat_logchats = 0

let g:calendar_google_calendar = 1

" Full screen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
map <F12> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230)<CR>

autocmd filetype gitcommit nnoremap c :Gcommit<CR>

nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

