if not status is-interactive
	exit 0
end

set -g fish_greeting

abbr -a ls ls -A
abbr -a ll ls -Al
abbr -a vim nvim
abbr -a stow stow -t \~

zoxide init --cmd cd fish | source
