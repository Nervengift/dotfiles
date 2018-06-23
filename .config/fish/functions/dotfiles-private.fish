function dotfiles-private -w git
	/usr/bin/git --git-dir=/home/clemens/.dotfiles-private/ --work-tree=/home/clemens $argv
end
