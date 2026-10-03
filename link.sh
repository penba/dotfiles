#!/usr/bin/env sh

set -e

main() {
	mkdir -p "$HOME/.config"

	link user helix
	link user fish
	link user ghostty

	link system keyd.conf "/etc/keyd/default.conf"
}

link() {
	scope="$1"
	source="$2"
	custom_path="$3"

	if [ -n "$custom_path" ]; then
		target="$custom_path"
	else
		target="$HOME/.config/$source"
	fi

	if [ -e	 "$target" ] || [ -L "$target" ]; then
		printf "%s already exists. Skipping.\n" "$target"
		return 0;
	fi

	case "$scope" in
		user)
			ln -s "$PWD/$source" "$target"
			printf "Successfully linked %s to %s\n." "$source" "$target"
			;;

		system)
			printf "Root privileges are required to link to %s\n." "$target"
			printf "Continue? [y/N]: "
			read -r confirm_character

			case "$confirm_character" in
				y|Y)
					sudo ln -s "$PWD/$source" "$target"
					printf "Successfully linked %s to %s\n." "$source" "$target"
					;;

				*)
					printf "Aborted.\n"
					;;
			esac
			;;
	esac
}

main
