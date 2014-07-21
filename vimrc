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
set viewoptions=folds,options,cursor,unix
" allow the cursor to pass the last character
set virtualedit=onemore
" store more command history
set history=100
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

nnoremap <C-right> :tabn<cr>
nnoremap <C-left> :tabp<cr>
nnoremap <C-t> :tabnew<cr>

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

" Plugins
set rtp+=~/.vim/vundle/
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" <3
Plugin 'jaxbot/selective-undo.vim'
Plugin 'jaxbot/brolink.vim'

" Git/github integration
Plugin 'jaxbot/github-issues.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
" Tools
Plugin 'jaxbot/semantic-highlight'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/loremipsum'
Plugin 'rking/ag.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'

" Syntaxes
Plugin 'tpope/vim-haml'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'jnwhiteh/vim-golang'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'moll/vim-node'
Plugin 'wavded/vim-stylus'
Plugin 'jelera/vim-javascript-syntax'

" Misc tpope goodies
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-obsession'

call vundle#end()

syntax on
filetype on
filetype plugin on
filetype plugin indent on

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Nodejs dictionary
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict

" Netrw remote transfers
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && ./%:r<CR>

" java compile files
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % && java %:r<CR>

" Make Markdown actually detected as Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Fugitive/Git Shortcuts
nnoremap <leader>g :Gstatus<CR>4j

" Unite mappings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
call unite#custom#source('file_rec', 'ignore_pattern', 'node_modules/')
call unite#custom#source('file_rec', 'ignore_pattern', '.git/')
let g:unite_source_history_yank_enable = 1

nnoremap <leader>e :Unite -start-insert file_mru<cr>
nnoremap <leader>f :Unite -start-insert file<cr>
nnoremap <leader>s :Unite -start-insert buffer<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <C-p> :Unite -start-insert file_rec<cr>

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

" Tell eclim to play nice with Neocomplete
let g:EclimCompletionMethod = 'omnifunc'

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" No scratch
set completeopt-=preview

" Full screen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <F12> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230)<CR>

" Use powerline fonts on airline
let g:airline_powerline_fonts = 1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
map <leader>p :Gist -c<CR>

" Local stuff (access_token, www folder, etc)
so ~/.local.vim

