if not status is-interactive
	return
end

set -g fish_greeting

set -gx VISUAL hx
set -gx EDITOR hx
set -gx BROWSER firefox
set -gx LESS '-R'

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
