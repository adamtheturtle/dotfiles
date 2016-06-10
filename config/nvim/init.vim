call plug#begin('~/.config/nvim/plug')

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
"Enable completion
"See https://github.com/Valloric/YouCompleteMe#mac-os-x
"for compilation requirements.
Plug 'Valloric/YouCompleteMe'
"Allow the use of `gc` to comment selected text.
Plug 'tomtom/tcomment_vim'

call plug#end()

colorscheme gruvbox
set background=dark

let g:ctrlp_extensions = ['funky']
nmap <C-k> <Plug>CtrlSFPrompt

"Show line numbers
:set number

"vim has issues if fish is the shell used to run commands
set shell=/bin/sh

"Allow copying by selecting with mouse to OS X clipboard
:set mouse+=a

"Allow copying to OS X clipboard with CTRL+C
:vmap <C-C> "+y"

"Remap escaping for built in terminal
tnoremap <Esc> <C-\><C-n>

