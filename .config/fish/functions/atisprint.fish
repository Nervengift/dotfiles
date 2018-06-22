function atisprint
	cat $argv[1] | ssh s_wallra@i08fs1.ira.uka.de lp -d pool-sw2 -o media=a4 -o sides=two-sided-long-edge -;
end
