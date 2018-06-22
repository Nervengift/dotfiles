function dotfiles -w git
	/usr/bin/git --git-dir=/home/clemens/.dotfiles/ --work-tree=/home/clemens $argv
end
