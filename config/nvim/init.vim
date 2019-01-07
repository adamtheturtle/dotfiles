"Install as per
"https://github.com/junegunn/vim-plug#installation
"Then :PlugInstall
call plug#begin('~/.config/nvim/plug')

"Rust syntax highlighting
Plug 'rust-lang/rust.vim'
Plug 'flazz/vim-colorschemes'

"Autocomplete quotes and brackets
Plug 'Raimondi/delimitMate'

"Quick switching between files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<Cr>

"Requires `brew install ack`
Plug 'dyng/ctrlsf.vim'

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

"Fast window choosing.
Plug 't9md/vim-choosewin'

"Live preview of search and replace
Plug 'osyo-manga/vim-over'

Plug 'w0rp/ale'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'dhruvasagar/vim-zoom'

set inccommand=nosplit

call plug#end()

colorscheme gruvbox
set background=dark

let g:ctrlp_extensions = []
nmap <C-k> :silent CtrlSF<space>

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
tnoremap <C-w> <C-\><C-n><C-w>

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

"Without this I get an error when opening a result from CtrlSF
let g:ctrlsf_confirm_unsaving_quit = 1

"Double tap \ to set a PDB
map <Leader><Leader> :call InsertPDB()<CR>

function! InsertPDB()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

let g:python_host_skip_check = 1

"Do not show overlay on '-' for choosing window.
"Showing an overlay caused random whitespace issues.
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 0

set colorcolumn=80

"Do not prompt before searching.
let ctrlsf_confirm_save = 0

au TermOpen * setlocal nonumber norelativenumber
