"  _____              _                   _   ___      _______ __  __ _____   _____ 
" |  __ \            | |                 | \ | \ \    / /_   _|  \/  |  __ \ / ____|
" | |  | | ___  _   _| | __ _  __ _ ___  |  \| |\ \  / /  | | | \  / | |__) | |     
" | |  | |/ _ \| | | | |/ _` |/ _` / __| | . ` | \ \/ /   | | | |\/| |  _  /| |     
" | |__| | (_) | |_| | | (_| | (_| \__ \ | |\  |  \  /   _| |_| |  | | | \ \| |____ 
" |_____/ \___/ \__,_|_|\__, |\__,_|___/ |_| \_|   \/   |_____|_|  |_|_|  \_\\_____|
"                        __/ |                                                      
"                       |___/                                                   
"


"========== Auto load for first time uses ========== 

if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dir
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"let g:nvim_plugins_installation_completed=1
"if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
"	let g:nvim_plugins_installation_completed=0
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"========== Editor Behavior ==========
set autochdir "Vim will change the current working directory whenever you open a file
set number "show the line number
set norelativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent "Use indent from the previous line
set splitright
set splitbelow
set ignorecase "Ignore the case when searching
set smartcase "Smart case matching
set wrap
set noshowmode " There will be no -- INSERT -- prompt below

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

" ========== Basic Mappings ==========
let mapleader=" "
noremap Q :q<CR>
noremap S :w<CR>
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>
inoremap <c-y> <ESC>A {}<ESC>i<CR><ESC>ko
"inoremap { {}<ESC>ha 
"inoremap " ""<ESC>ha
"inoremap ( ()<ESC>ha

" ========== Moving Cursor ==========
noremap J 10j
noremap K 10k

" ========== Window Management ==========
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>
" Place the two screens up and down
noremap sc <C-w>t<C-w>K
" " Place the two screens side by side
noremap sv <C-w>t<C-w>H


" ========== Install Plugins with Vim-Plug ==========
call plug#begin('$HOME/.config/nvim/plugged')

" == Editor Behavior ==
Plug 'preservim/nerdcommenter' " <leader> ci to toggle comment.
Plug 'godlygeek/tabular'       " Command: Tabularize <regex> to align
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] } " Semantic highlighting for python. Run :UpdateRemotePlugins after install.
Plug 'terryma/vim-multiple-cursors' " realize a multiple cursor functionality like vscode

" == Auto Completion ==
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto completion. You also have to install coc extensions.
Plug 'neoclide/coc.nvim', { 'commit': '63dd239bfe02998810b39d039827e2510885b57b', 'do': 'yarn install --frozen-lockfile' }

" == File Navigator ==
Plug 'preservim/nerdtree' " provide a tree-style file explorer.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ibhagwan/fzf-lua' " quickly find a file in the system

" == Status line ==
"Plug 'vim-airline/vim-airline' " Add a status bar below
Plug 'itchyny/lightline.vim' " A simpler status line

" == Code Related ==
Plug 'nvim-treesitter/nvim-treesitter' " Better syntax highlighting


" Plug 'mbbill/undotree' " Show undo history
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] } " Easy writing table in markdown

call plug#end()


" ========== Plugin Setting ========== 
set laststatus=2



" ========== Plugin Mapping ==========
" NERDTree
map tt :NERDTreeToggle<CR>




" ========== coc.vim config ==========
let g:coc_global_extensions = [
		\ 'coc-clangd',
		\ 'coc-pyright',
		\ 'coc-sh'
	  \ ]

" vscode like multiline editing
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
	if !get(b:, 'coc_cursors_activated', 0)
		return "\<Plug>(coc-cursors-word)"
	endif
	return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" This function do not check if the last character you inserted is backspace!
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>i to show documentation in preview window
nnoremap <silent> <LEADER>i :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

