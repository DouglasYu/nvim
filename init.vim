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
set tabstop=4
set shiftwidth=4
set autoindent "Use indent from the previous line
set splitright
set splitbelow
set ignorecase "Ignore the case when searching
set smartcase "Smart case matching
set wrap

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo
endif

" ========== Basic Mappings ==========
let mapleader=" "
noremap Q :q<CR>
noremap S :w<CR>
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>
inoremap <c-y> <ESC>A {}<ESC>i<CR><ESC>ko

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
noremap sh <C-w>t<C-w>K
" " Place the two screens side by side
noremap sv <C-w>t<C-w>H


" ========== Install Plugins with Vim-Plug ==========
call plug#begin('$HOME/.config/nvim/plugged')

Plug 'preservim/nerdcommenter' " <leader> ci to toggle comment.
Plug 'godlygeek/tabular'       " Command: Tabularize <regex> to align
Plug 'numirias/semshi' " Semantic highlighting for python. Run :UpdateRemotePlugins after install.
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto completion. You also have to install coc extensions.
Plug 'preservim/nerdtree' " :NERDTree<CR> to open the file explorer.
Plug 'vim-airline/vim-airline' " Add a status bar below

" Plug 'mbbill/undotree' " Show undo history
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] } " Easy writing table in markdown


" ========== Plugin Mapping ==========
nnoremap tt :NERDTree<CR>


call plug#end()
