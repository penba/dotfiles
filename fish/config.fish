if not status is-interactive
    return
end

set -g fish_greeting

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
