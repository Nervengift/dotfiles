function anlage
	bash -c "echo -n anlage $argv[1] > /dev/udp/bananapi-clemens/26524"
end

complete --no-files -c anlage  -a "an aus"
