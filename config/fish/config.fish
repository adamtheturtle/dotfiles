set -gx PATH $PATH ~/.local/bin
# Set `ls` output to be teal
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
alias vim=nvim
eval (python -m virtualfish)
set -gx EDITOR vim

# See https://github.com/neovim/neovim/issues/5348
set -x 'VIM' ''
set -x 'VIMRUNTIME' ''

