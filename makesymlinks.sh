#!/bin/bash

set -euo pipefail

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
backup_root="$HOME/Documents/dotfiles_old"
backup_dir=
files=(
    config/fish/config.fish
    config/nvim/init.vim
    tmux.conf
    ssh/config
    pypirc
    config/zed/settings.json
)

for file in "${files[@]}"; do
    source="$dotfiles_dir/$file"
    destination="$HOME/.$file"
    if [[ -L "$destination" ]] && [[ "$(readlink "$destination")" == "$source" ]]; then
        continue
    fi
    if [[ ! -f "$source" ]]; then
        printf 'Missing dotfile: %s\n' "$source" >&2
        exit 1
    fi

    mkdir -p "$(dirname "$destination")"
    if [[ -e "$destination" || -L "$destination" ]]; then
        if [[ -z "$backup_dir" ]]; then
            mkdir -p "$backup_root"
            backup_dir="$(mktemp -d "$backup_root/backup.XXXXXXXX")"
        fi
        backup="$backup_dir/.$file"
        mkdir -p "$(dirname "$backup")"
        mv "$destination" "$backup"
        printf 'Backed up %s to %s\n' "$destination" "$backup"
    fi
    ln -s "$source" "$destination"
done
