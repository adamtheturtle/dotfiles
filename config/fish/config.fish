set -gx GPG_TTY $tty
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
# Set `ls` output to be teal
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
alias vim=nvim
set -gx EDITOR vim

# See https://github.com/neovim/neovim/issues/5348
set -x 'VIMRUNTIME' ''
set -x 'VIM' ''

# Ideally we would run 'eval (/opt/homebrew/bin/brew shellenv)'
# However, there is a bad interaction with Nova:
# https://devforum.nova.app/t/homebrew-fish-nova-errors/2013.
# Therefore, I have once run 'eval (/opt/homebrew/bin/brew shellenv)'
# and then moved the result here.
set -gx HOMEBREW_PREFIX "/opt/homebrew"
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
set -q PATH; or set PATH ''
set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH
set -q MANPATH; or set MANPATH ''
set -gx MANPATH "/opt/homebrew/share/man" $MANPATH
set -q INFOPATH; or set INFOPATH ''
set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set fish_greeting

functions --copy fish_prompt default_fish_prompt
function fish_prompt
    virtualfish_prompt
    default_fish_prompt
end

# Put pyenv environments on the PATH.
# This is useful e.g. for tox.
pyenv init - | source
