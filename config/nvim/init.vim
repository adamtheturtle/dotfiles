"Install as per
"https://github.com/junegunn/vim-plug#installation
"Then :PlugInstall
call plug#begin('~/.config/nvim/plug')

"Rust syntax highlighting
Plug 'rust-lang/rust.vim'
Plug 'mitsuhiko/vim-python-combined'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tacahiroy/ctrlp-funky'
"Fish shell script highlighting
Plug 'dag/vim-fish'
"Enable completion
"See https://github.com/Valloric/YouCompleteMe#mac-os-x
"for compilation requirements.
Plug 'Valloric/YouCompleteMe'
"Allow the use of `gc` to comment selected text.
Plug 'tomtom/tcomment_vim'

"Highlight trailing whitespace and then introduce a command to strip it
Plug 'ntpeters/vim-better-whitespace'

"Show the current class / method etc.
"Requires `brew install ctags` and a `let` as below (search for tagbar)
Plug 'majutsushi/tagbar'
call plug#end()

colorscheme gruvbox
set background=dark

let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:ctrlp_extensions = ['funky']
nmap <C-k> <Plug>CtrlSFPrompt

"Show line numbers
set number

"Highlight Python builtins
let python_highlight_all = 1

"vim has issues if fish is the shell used to run commands
set shell=/bin/sh

"Allow copying by selecting with mouse to OS X clipboard
set mouse+=a

"Disable swapfile
set noswapfile
set nobackup

"Allow copying to OS X clipboard with CTRL+C
"This doesn't work in tmux
vmap <C-C> "+y"

"Remap escaping for built in terminal
tnoremap <Esc> <C-\><C-n>

"Indenting suitable for Python
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

"Enter insert mode when going into a :terminal split
autocmd WinEnter term://* startinsert

"Python 3 support for Syntastic
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
"Make sure to have these checkers on the $PATH
"e.g. by using `pipsi`.
"Make sure to install these checkers with the right Python version.
let g:syntastic_python_checkers = ['flake8']

"Without this I get an error when opening a result from CtrlSF
let g:ctrlsf_confirm_unsaving_quit = 1
