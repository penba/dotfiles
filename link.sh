#!/usr/bin/env sh

set -e

link() {
	required_permissions="$1"
	folder_name="$2"
	custom_path="$3"

	if [ -n "$custom_path" ]; then
		target_path="$custom_path"
	else
		target_path="$HOME/.config/$folder_name"
	fi

	if [ -e	 "$target_path" ] || [ -L "$target_path" ]; then
		printf "%s already exists. Skipping.\n" "$target_path"
		return 0;
	fi

	case "$required_permissions" in
		user)
			ln -s "$PWD/$folder_name" "$target_path"
			printf "Successfully linked %s to %s\n." "$folder_name" "$target_path"
			;;

		system)
			printf "Root privileges are required to link to %s\n." "$target_path"
			printf "Continue? [y/N]: "
			read -r confirm_character

			case "$confirm_character" in
				y|Y)
					sudo ln -s "$PWD/$folder_name" "$target_path"
					printf "Successfully linked %s to %s\n." "$folder_name" "$target_path"
					;;

				*)
					printf "Aborted.\n"
					;;
			esac
			;;
	esac
}

mkdir -p "$HOME/.config"

link user helix
link user fish
link user ghostty

link system keyd.conf "/etc/keyd/default.conf"
