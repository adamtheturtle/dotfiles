set -gx GPG_TTY $tty
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
# Set `ls` output to be teal
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
alias vim=nvim
set -gx EDITOR vim

set -gx DOTNET_ROOT /usr/local/share/dotnet

# See https://github.com/neovim/neovim/issues/5348
set -x 'VIMRUNTIME' ''
set -x 'VIM' ''

eval (/opt/homebrew/bin/brew shellenv)

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Do not have a greeting message on each shell.
set fish_greeting

status --is-interactive; and rbenv init - fish | source
