function unshorten
	curl -sI $argv[1] | sed -n 's/location: *//p'
end
