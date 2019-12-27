set -gx GPG_TTY $tty
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
# Set `ls` output to be teal
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
alias vim=nvim
eval (python3 -m virtualfish)
set -gx EDITOR vim

# See https://github.com/neovim/neovim/issues/5348
set -x 'VIMRUNTIME' ''
set -x 'VIM' ''

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# added by pipsi (https://github.com/mitsuhiko/pipsi)
set -x PATH /Users/Adam/.local/bin $PATH

set fish_greeting

function fish_prompt
  set_color $fish_color_cwd
    printf '%s ' (prompt_pwd)
    set_color normal

  # Line 2
	if set -q VIRTUAL_ENV
		echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
	end
    printf '~> '
    set_color normal
end
