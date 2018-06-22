function club
	set offen (curl -s club.entropia.de/spaceapi|jq -r 'if .open then "...ist offen" else "...ist zu" end')
	set leases (curl -s https://nyx.n621.de/~florolf/club/ |grep -oP '(?<=, sonst 0\): )[0-9]+')
	echo "$offen ($leases aktive Leases)"
	test $offen = "...ist offen"
end
