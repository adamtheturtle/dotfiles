set -gx PATH $PATH ~/.local/bin
# Set `ls` output to be teal
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
alias vim=nvim
eval (python -m virtualfish)
set -gx EDITOR vim

# See https://github.com/neovim/neovim/issues/5348
set -x 'VIMRUNTIME' ''
set -x 'VIM' ''

# To get a virtualfish prompt, run:
# 	`fisher install adamtheturtle/virtualfish-prompt`
functions -q virtualfish_prompt; and virtualfish_prompt
