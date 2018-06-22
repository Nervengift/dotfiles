function weechat
	python2 ~/bin/pyrnotify.py&
	autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" clemens@altitoxin.nerven.gift -R 4321:localhost:4321 -t -- tmux attach -d -t weechat
	kill %1
end
