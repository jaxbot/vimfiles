set encoding=utf-8

" Look
set background=dark
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

" Make macros render faster (lazy draw)
set lazyredraw

" No scratch (little box that shows a definition)
set completeopt-=preview

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

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Hide hightlights on Esc
"nnoremap <Esc> :nohl<Esc>

" Plugins
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'


" Git/github integration
NeoBundle 'tpope/vim-fugitive'             " The mother of all Git plugins, most build off of this

"NeoBundle 'airblade/vim-gitgutter'         " Show git hunk changes on the gutter (near line numbers)
"NeoBundle 'jaxbot/github-issues.vim'       " Pulls in GitHub issues into Vim

" Allows quickly posting to Gist
NeoBundle 'mattn/gist-vim', {
\  'lazy' : 1,
\  'autoload' : {
\    'commands' : ['Gist']
\  }
\}
" Support library for above
NeoBundle 'mattn/webapi-vim', {
\  'lazy' : 1,
\  'autoload' : {
\    'function_prefix': 'webapi',
\    'on_source' : ['gist-vim']
\  }
\}

" Tools
" Allows highlighting variables by name rather than type
NeoBundle 'jaxbot/semantic-highlight.vim', {
\  'lazy' : 1,
\  'autoload' : {
\    'commands' : ['SemanticHighlight']
\  }
\}
" Dummy text generator
NeoBundle 'vim-scripts/loremipsum', {
\  'lazy' : 1,
\  'autoload' : {
\    'commands' : ['Loremipsum']
\  }
\}

NeoBundle 'bling/vim-airline'              " Better status bar
NeoBundle 'scrooloose/nerdtree'            " File picker bar
" Easy searching with Ag (like Ack)
NeoBundle 'rking/ag.vim', {
\  'lazy': 1,
\  'autoload' : {
\    'commands' : ['Ag']
\  }
\}
NeoBundle 'Shougo/neocomplete.vim'         " Autocomplete/omnicomplete
" I use this for file/buffer searching/switching
NeoBundle 'Shougo/unite.vim', {
\  'lazy': 1,
\  'autoload' : {
\    'mappings': ['<leader>s', '<leader>f', '<leader>e']
\  }
\}
" Component of above
NeoBundle 'Shougo/neomru.vim', {
\  'lazy': 1,
\  'depends': 'Shougo/unite.vim'
\}

NeoBundle 'christoomey/vim-tmux-navigator' " Integrate Vim with tmux so I can seamlessly move between splits
NeoBundleLazy 'edkolev/tmuxline.vim'           " Build tmux status lines based on the airline in Vim
" Syntax checker
NeoBundle 'scrooloose/syntastic', {
\  'lazy': 1,
\  'autoload': {
\    'commands': ['SyntasticCheck']
\  }
\}
" Syntaxes
" HAML, Sass, Scss
NeoBundle 'tpope/vim-haml', {
\  'lazy': 1,
\  'autoload': {
\    'filetypes': ['scss', 'sass', 'haml']
\  }
\}
NeoBundle 'evanmiller/nginx-vim-syntax'    " Nginx configuration file coloring
" Go
NeoBundle 'jnwhiteh/vim-golang', {
\  'lazy': 1,
\  'autoload': {
\    'filetypes': ['go']
\  }
\}

" Autocomplete for Node.js
NeoBundle 'myhere/vim-nodejs-complete', {
\  'lazy': 1,
\  'autoload': {
\    'filetypes': ['javascript']
\  }
\}
" Easy node module opening
NeoBundle 'moll/vim-node', {
\  'lazy': 1,
\  'autoload': {
\    'filetypes': ['javascript']
\  }
\}
NeoBundle 'wavded/vim-stylus'              " Stylus syntax
NeoBundle 'jelera/vim-javascript-syntax'   " Better JavaScript syntax handling
NeoBundle 'kchmck/vim-coffee-script'       " CoffeeScript support
NeoBundle 'groenewege/vim-less'            " LESS support
NeoBundle 'elzr/vim-json'                  " Better JSON handling
NeoBundle 'pangloss/vim-javascript'        " Support library for above
NeoBundle 'mxw/vim-jsx'                    " JSX highlighting
" Misc tpope goodies
NeoBundle 'tpope/vim-sleuth'               " Automatically determine indent settings for file
NeoBundle 'tpope/vim-eunuch'               " Unix helpful commands (i.e. Unlink)
NeoBundle 'tpope/vim-commentary'           " Comment things out

call neobundle#end()

" Now that all syntax plugins are in the runtime path, turn on the syntax engine
syntax on
filetype plugin indent on

colorscheme jellybeans
