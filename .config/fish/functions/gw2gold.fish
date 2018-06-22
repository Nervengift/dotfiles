function gw2gold
	set coin (curl -s -H "Authorization: Bearer "(pass Internet/guildwars/apikeys/foo-guildwars2@nervengiftlabs.de/test)  https://api.guildwars2.com/v2/account/wallet|jq ".[]|select(.id  == 1)|.value")
	set g (math "$coin/10000")
	set s (math "($coin/100)%100")
	set c (math "$coin%100")
	set_color yellow; echo -n $g"G "
	set_color white; echo -n $s"S "
	set_color red; echo $c"C"
	set_color normal
end
