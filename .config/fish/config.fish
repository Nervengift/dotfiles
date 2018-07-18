. "$HOME/.config/fish/vi-mode.fish"
. /usr/share/autojump/autojump.fish

function fish_user_key_bindings
	vi_mode_insert
end

function fish_greeting
	fortune -s
end

set -gx EDITOR vim
set -gx GOPATH "$HOME/.go"
set -gx PATH $HOME/bin $HOME/.gem/ruby/2.5.0/bin $HOME/.cargo/bin $GOPATH/bin $PATH

if [ "$TERM" = "xterm" ]
	export TERM=xterm-256color
end

alias ip="ip --color"
alias ipb="ip --color --brief"
