if not status is-interactive
	exit 0
end

set -g fish_greeting

abbr -a ls ls -A

zoxide init --cmd cd fish | source
