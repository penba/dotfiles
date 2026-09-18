if not status is-interactive
	exit 0
end

set -g fish_greeting

function safe_stow
	set git_root (git rev-parse --show-toplevel 2>/dev/null)
	and string match -q "dotfiles" $git_root
	or { echo "Not in dotfiles repo"; return 1; }
end

abbr -a ls ls -A
abbr -a ll ls -Al
abbr -a vim nvim
abbr -a stow safe_stow

zoxide init --cmd cd fish | source
