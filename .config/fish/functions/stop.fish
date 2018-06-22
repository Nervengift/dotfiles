function stop -d "SIGSTOP a program"
	killall -SIGSTOP $argv
end

function cont -d "SIGCONT a program"
	killall -SIGCONT $argv
end

function __complete_stopped
	ps axo stat,comm|awk '/^T/ {print $2}'
end

complete -c stop -xa '(__fish_complete_proc)'
complete -c cont -xa '(__complete_stopped)'
