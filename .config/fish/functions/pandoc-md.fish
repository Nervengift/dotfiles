function pandoc-md
	while true
		date
		pandoc $argv[1] -V geometry:margin=2cm -o $argv[1].pdf
		inotifywait -e modify $argv[1]  2>/dev/null
	end
end
