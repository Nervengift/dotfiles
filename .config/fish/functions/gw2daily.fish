function gw2daily
	curl -s 'https://api.guildwars2.com/v2/achievements/daily'|jq '.pve[]|select(.required_access[] | contains("HeartOfThorns"))|select(.level.max == 80)|.id'|while read event
		 curl -s "https://api.guildwars2.com/v2/achievements?id={$event}&lang=de"|jq '.name' -r
	 end|sponge
 end
