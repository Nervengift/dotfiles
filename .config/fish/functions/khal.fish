function khal
	chronic vdirsyncer sync
	/usr/bin/khal $argv
	chronic vdirsyncer sync
end
