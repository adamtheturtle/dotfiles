#!/bin/bash

set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
test_home="$(mktemp -d)"
trap 'rm -rf "$test_home"' EXIT
export HOME="$test_home"

destination="$HOME/.config/fish/config.fish"
backup_root="$HOME/Documents/dotfiles_old"
mkdir -p "$(dirname "$destination")" "$backup_root"
printf 'legacy backup\n' > "$backup_root/config.fish"
printf 'original Fish settings\n' > "$destination"

bash "$repo_dir/makesymlinks.sh"
[[ "$(readlink "$destination")" == "$repo_dir/config/fish/config.fish" ]]
backups=("$backup_root"/backup.*/)
[[ ${#backups[@]} -eq 1 ]]
first_backup="${backups[0]}".config/fish/config.fish
[[ "$(cat "$first_backup")" == 'original Fish settings' ]]

bash "$repo_dir/makesymlinks.sh"
[[ "$(readlink "$destination")" == "$repo_dir/config/fish/config.fish" ]]
backups=("$backup_root"/backup.*/)
[[ ${#backups[@]} -eq 1 ]]
[[ "$(cat "$first_backup")" == 'original Fish settings' ]]
[[ "$(cat "$backup_root/config.fish")" == 'legacy backup' ]]

rm "$destination"
printf 'new local settings\n' > "$destination"
bash "$repo_dir/makesymlinks.sh"
[[ "$(readlink "$destination")" == "$repo_dir/config/fish/config.fish" ]]
backups=("$backup_root"/backup.*/)
[[ ${#backups[@]} -eq 2 ]]
[[ "$(cat "$first_backup")" == 'original Fish settings' ]]
grep -qFx 'new local settings' "$backup_root"/backup.*/.config/fish/config.fish
