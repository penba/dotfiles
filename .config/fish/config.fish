if not status is-interactive
	exit 0
end

function fish_greeting
end

abbr -a ls ls -A

zoxide init --cmd cd fish | source
