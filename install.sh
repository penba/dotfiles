#!/usr/bin/env sh

set -e

link() {
  if [ -n "$3" ]; then
    target="$3"
  else
    target="$HOME/.config/$2"
  fi

  if [ -e  "$target" ] || [ -L "$target" ]; then
    printf "%s already exists\n" "$target"
  else
    if [ "$1" = "user" ]; then
      ln -s "$PWD/$2" "$target"
      printf "Linked %s to %s\n" "$2" "$target"
    elif [ "$1" = "system" ]; then
      printf "Root privileges are required to link to %s\n" "$target"
      printf "Continue [y/N]: "
      read -r confirm
      case "$confirm" in
        y|Y)
          sudo ln -s "$PWD/$2" "$target"
          printf "Linked %s to %s\n" "$2" "$target"
          ;;
        *)
          printf "Aborted\n"
          ;;
      esac
    fi
  fi
}

mkdir -p "$HOME/.config"

link user helix
link user fish
link user ghostty

link system keyd.conf "/etc/keyd/default.conf"
