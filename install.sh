#!/usr/bin/env sh

set -e

link() {
  target="$HOME/.config/$1"
  if [ -e  "$target" ] || [ -L "$target" ]; then
    printf "%s already exists\n" "$target"
  else
    ln -s "$PWD/$1" "$target"
    printf "Linked %s to %s\n" "$1" "$target"
  fi
}

mkdir -p "$HOME/.config"

link helix
link fish
link ghostty
