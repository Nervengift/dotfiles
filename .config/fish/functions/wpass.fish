function wpass
	set -lx PASSWORD_STORE_DIR ~/Dokumente/DHBW_OPTES/password-store
	pass $argv
end

complete -f -c wpass -a '(
	set -l cmd (commandline -op);
	set -e cmd[1];
	set tmp $PASSWORD_STORE_DIR
	set -x PASSWORD_STORE_DIR ~/Dokumente/DHBW_OPTES/password-store # hacky, but -lx does not work
	complete -C"pass $cmd";
	set -x PASSWORD_STORE_DIR $tmp
)'
