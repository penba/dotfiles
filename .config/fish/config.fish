if not status is-interactive
	exit 0
end

function fish_greeting
end

zoxide init --cmd cd fish | source
