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
nnoremap ; :nohl<Esc>

" Plugins
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'


" Git/github integration
NeoBundle 'tpope/vim-fugitive'             " The mother of all Git plugins, most build off of this

NeoBundle 'airblade/vim-gitgutter'         " Show git hunk changes on the gutter (near line numbers)
"NeoBundle 'jaxbot/github-issues.vim'

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

" Better status bar
NeoBundle 'bling/vim-airline'
" File picker bar
NeoBundle 'scrooloose/nerdtree'
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

" Integrate Vim with tmux so I can seamlessly move between splits
NeoBundle 'christoomey/vim-tmux-navigator'
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

" I use JavaScript a lot
let g:javascript_lazy = {
\  'lazy': 1,
\  'autoload': {
\    'filetypes': ['javascript']
\  }
\}

" Autocomplete for Node.js
NeoBundle 'myhere/vim-nodejs-complete', g:javascript_lazy
" Easy node module opening
NeoBundle 'moll/vim-node', g:javascript_lazy
" Better JavaScript syntax handling
NeoBundle 'jelera/vim-javascript-syntax', g:javascript_lazy
" CoffeeScript support
NeoBundle 'kchmck/vim-coffee-script'
" Better JSON handling
NeoBundle 'elzr/vim-json', {
\  'lazy': 1,
\  'autoload': {
\    'filetypes': ['json']
\  }
\}
" Support library for above
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx', g:javascript_lazy
" Misc tpope goodies
" Automatically determine indent settings for file
NeoBundle 'tpope/vim-sleuth'
" Unix helpful commands (i.e. Unlink)
NeoBundle 'tpope/vim-eunuch', {
\  'lazy': 1,
\  'autoload': {
\    'commands': ['Unlink', 'Rename']
\  }
\}
" Comment things out
NeoBundle 'tpope/vim-commentary', {
\  'lazy': 1,
\  'autoload': {
\    'commands': ['Commentary']
\  }
\}
" Highlight navigation for F/f
NeoBundle 'unblevable/quick-scope'

call neobundle#end()

" Now that all syntax plugins are in the runtime path, turn on the syntax engine
syntax on
filetype plugin indent on

colorscheme jellybeans

" Plugin configuration

" Neocomplete
" Automatically suggest things
let g:neocomplete#enable_at_startup = 1
" test matches Test and test, but Test only matches Test
let g:neocomplete#enable_smart_case = 1
" Show starting at 2 characters
let g:neocomplete#sources#syntax#min_keyword_length = 2
" Nodejs dictionary, used by neocomplete through omnicomplete
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Netrw remote transfers
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

" Airline
" Use powerline fonts on airline
let g:airline_powerline_fonts = 1

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

" Ag, the silver searcher mapping
map <C-\> :execute "Ag " . expand("<cword>") <CR>

" Browserlink.vim
let g:bl_autostart = 1
au BufWritePost */static/templates/*.html :BLReloadTemplate

" Github-issues.vim
" Search upstream issues as well (useful for forks)
let g:github_upstream_issues = 1

" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" Other mappings and configuration

" Convenient mappings for compiling and running quick, used mostly for school
" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && ./%:r<CR>
" java compile files
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % && java %:r<CR>
" node run files
autocmd filetype javascript nnoremap <Leader>c :w <CR>:!node %<CR>

" Fugitive/Git Shortcuts
nnoremap <leader>g :Gstatus<CR>4j

" Make Markdown actually detected as Markdown instead of the default
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Show trailing whitespace as red
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Change dir to file path on ,d
nnoremap ,d :lcd %:p:h<CR>

" Prettify JSON command
command! JSONPretty %!python -m json.tool

" Blog custom settings (rebuild on save)
autocmd BufWritePost */jme/* silent :!node moderate/generate.js devel
autocmd BufWritePost */jme/* silent :BLReloadPage

" JSX (React) config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" via https://gist.github.com/cszentkiralyi/dc61ee28ab81d23a67aa
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

" Yosemite shell bug workaround
" https://github.com/gmarik/Vundle.vim/issues/510
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif

" Local stuff (access_token, etc)
if filereadable(glob("~/.local.vim"))
    so ~/.local.vim
endif
