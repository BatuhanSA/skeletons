" Enable user overrides.
set nocompatible

"""
""" Functionality
"""

" Indentation
set autoindent
set smartindent
set expandtab
set smarttab
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Use the mouse using the xterm defaults.
behave xterm

" Remember up-to 1000 lines (') for the last 50 (") files opened.
" Also jump back to where we last opened a file (%).
set viminfo='50,\"1000,%

" Keep 5000 lines of command history.
set history=5000

" Defualt clipboard is systems clipboard.
set clipboard=unnamed

" Highlight the line the cursosrs is at.
set cursorline

" Reset the cursor to the last position when we re-open a file.
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Make backspace work like most other applications.
set backspace=indent,eol,start

" Make the autocomplete menu like bash.
set wildmenu
set wildmode=longest,list

" Prevent some security issues by ignoring modelines.
" I don't want to use modelines anyways.
" https://lwn.net/Vulnerabilities/20249/
set modelines=0

"Ensures your file ends with a newline.
set fixeol

set splitright

"""
""" VISIUAL
"""

" Colors on.
syntax on
filetype plugin on

" Hilight search results,
" but use control-/ (defined below) to disable the highlight until the next search.
set hlsearch

" Start searching as we type (only really matters with hlsearch).
set incsearch

" case-insensitive by default
set ignorecase

" BUT become case-sensitive if pattern has capitals
set smartcase

" Wrap lines by default.
set wrap

" Make lines breaks more obvious.
set showbreak=+++\ \

" Show matching bookends.
set showmatch

" Dont show which mode (insert, replace, visual).
" Air-line will do it.
set noshowmode

" Show line numebr
set number

" Show the filename in the window.
set title

"""
""" Mappings
"""

" spacebar as leader
let mapleader=" "

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>t :vert term<CR>
nnoremap <C-l> :nohlsearch<CR>
nnoremap y "+y
nnoremap yy "+yy

" If syntax break (or filetype changes), use F12 to redo coloring.
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Use F7 to put a visual bar at 80 characters, use F8 to clear.
:map <F7> :set colorcolumn=80<cr>
:map <F8> :set colorcolumn=0<cr>

" Use <shift>-F7 to put a visual bar at 100 characters, use <shift>-F8 to clear.
:map <S-F7> :set colorcolumn=100<cr>
:map <S-F8> :set colorcolumn=0<cr>

" Use F9 to toggle underline on the cursor's line.
:map <F9> :set cul!<cr>

" Toggle paste mode.
:map <F3> :set paste!<cr>

" Use Option (space) + arrow keys to move between splits
nnoremap <Leader><Left> <C-w>h
nnoremap <Leader><Right> <C-w>l
nnoremap <Leader><Up> <C-w>j
nnoremap <Leader><Down> <C-w>k
nnoremap <leader>s :set spell!<cr>
nnoremap <leader>z z=

" Don't highlight line comments in JSON.
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType json syntax match Comment +#.\+$+


"""
""" Plugins
"""

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

" colorscheme default
set background=dark
colorscheme gruvbox

highlight SpellBad ctermfg=Red

