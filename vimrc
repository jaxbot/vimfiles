set encoding=utf-8

" Look
set background=dark
colorscheme jellybeans
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h10

" Show line numbers
set number
" Relative line numbers
set rnu
" No menus, scrollbars, or other junk
set guioptions=

" Make backspace delete characters
set backspace=2

" I like my leader being ','. It's easier to reach
let mapleader = ","

" Disable chimes when pressing something invalid, etc.
set visualbell
set t_vb =
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" Disable backup and swap files
set nobackup
set noswapfile

" Automatically load changed files
set autoread
" Use the OS clipboard
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

" Show status line
set laststatus=2

" Show matching brackets/parenthesis
set showmatch
" Don't blink when matching
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

" Indentation options
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1


" Mappings I like
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

" Plugins
set rtp+=~/.vim/vundle/
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" <3
Plugin 'jaxbot/selective-undo.vim'
Plugin 'jaxbot/brolink.vim'

" Git/github integration
Plugin 'tpope/vim-fugitive'             " The mother of all Git plugins, most build off of this
Plugin 'airblade/vim-gitgutter'         " Show git hunk changes on the gutter (near line numbers)
Plugin 'gregsexton/gitv'                " Allows easily viewing file history, integrated with Fugitive
Plugin 'jaxbot/github-issues.vim'       " Pulls in GitHub issues into Vim
Plugin 'mattn/gist-vim'                 " Allows quickly posting to Gist
Plugin 'mattn/webapi-vim'               " Support library for above
Plugin 'vim-lawrencium'                 " Mercurial integration for Vim
" Tools
Plugin 'jaxbot/semantic-highlight.vim'  " Allows highlighting variables by name rather than type
Plugin 'bling/vim-airline'              " Better status bar
Plugin 'scrooloose/nerdtree'            " File picker bar
Plugin 'vim-scripts/loremipsum'         " Dummy text generator
Plugin 'rking/ag.vim'                   " Easy searching with Ag (like Ack)
Plugin 'Shougo/neocomplete.vim'         " Autocomplete/omnicomplete
Plugin 'Shougo/unite.vim'               " I use this for file/buffer searching/switching
Plugin 'Shougo/neomru.vim'              " Component of above
Plugin 'christoomey/vim-tmux-navigator' " Integrate Vim with tmux so I can seamlessly move between splits
Plugin 'edkolev/tmuxline.vim'           " Build tmux status lines based on the airline in Vim
Plugin 'jaxbot/vCoolor.vim'             " Color picker
Plugin 'scrooloose/syntastic'           " Syntax checker
Plugin 'godlygeek/tabular'              " I installed this to align these comments
Plugin 'rizzatti/dash.vim'              " Dash integration
" Syntaxes
Plugin 'tpope/vim-haml'                 " HAML, Sass, Scss
Plugin 'evanmiller/nginx-vim-syntax'    " Nginx configuration file coloring
Plugin 'jnwhiteh/vim-golang'            " Go
Plugin 'myhere/vim-nodejs-complete'     " Autocomplete for Node.js
Plugin 'moll/vim-node'                  " Easy node module opening
Plugin 'wavded/vim-stylus'              " Stylus syntax
Plugin 'jelera/vim-javascript-syntax'   " Better JavaScript syntax handling
Plugin 'kchmck/vim-coffee-script'       " CoffeeScript support
Plugin 'groenewege/vim-less'            " LESS support
Plugin 'elzr/vim-json'                  " Better JSON handling
" Misc tpope goodies
Plugin 'tpope/vim-sleuth'               " Automatically determine indent settings for file
Plugin 'tpope/vim-scriptease'           " Tools for building more Vim plugins
Plugin 'tpope/vim-eunuch'               " Unix helpful commands (i.e. Unlink)
Plugin 'tpope/vim-commentary'           " Comment things out
Plugin 'tpope/vim-dispatch'             " Build runner

call vundle#end()

syntax on
filetype on
filetype plugin on
filetype plugin indent on

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Nodejs dictionary
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

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
call unite#custom#profile('files', 'filters', ['sorter_rank'])
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
call unite#custom#source('file_rec', 'ignore_pattern', 'node_modules/')
call unite#custom#source('file_rec', 'ignore_pattern', '.git/')
let g:unite_source_history_yank_enable = 1

nnoremap <leader>e :Unite -start-insert file_mru<cr>
nnoremap <leader>f :Unite -start-insert file_rec<cr>
nnoremap <leader>s :Unite -start-insert buffer<cr>
nnoremap <leader>y :Unite history/yank<cr>

" Ag, the silver searcher
map <C-\> :execute "Ag " . expand("<cword>") <CR>

" Brolink
let g:bl_autostart = 1
au BufWritePost */static/templates/*.html :BLReloadTemplate

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
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" No scratch
set completeopt-=preview

" Use powerline fonts on airline
let g:airline_powerline_fonts = 1

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
map <leader>p :Gist -c<CR>

" Github-issues.vim
" Search upstream issues as well (useful for forks)
let g:github_upstream_issues = 1
" Use threading
let g:gissues_async_omni = 1

" Change dir to file path on ,d
nnoremap ,d :lcd %:p:h<CR>

" Prettify JSON command
command! JSONPretty %!python -m json.tool

" Dash
nmap <silent> <leader>z <Plug>DashSearch

" Blog custom settings
autocmd BufWritePost */jme/* silent :!node moderate/generate.js devel
autocmd BufWritePost */jme/* silent :BLReloadPage

" Yosemite shell bug workaround
" https://github.com/gmarik/Vundle.vim/issues/510
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif

" Local stuff (access_token, www folder, etc)
so ~/.local.vim

