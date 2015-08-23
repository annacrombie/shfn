function loot_ {
	if [[ $1 = c ]]; then
		if [[ $((RANDOM%10)) -ge 3 ]]; then
			local potGot=$((RANDOM%3+1))
			echo "$potGot Potions"
			potions=$(($potions+$potGot))
			space_
		else
			local dollarGot=$((RANDOM%500+200))
			((stat_gold=$stat_gold+$dollarGot))
			echo "$dollarGot Gold"
			gold=$(($gold+$dollarGot))
			space_
		fi
	elif [[ $1 = wc ]]; then
		inventory_ add 8	
	else
		local goldGot=$((${enemy[1]}/6*7))
		if [[ $(echo ${inv[@]} | grep 13) ]]; then
			local goldGot=$(($goldGot*2))
		fi
		((stat_gold=$stat_gold+$goldGot))
		gold=$(($gold+$goldGot))
		local xpGot=$((RANDOM%${enemy[1]}+10*2))
		xp=$(($xp+$xpGot))
		local goldPad=$(head -c $((8-$(echo "$goldGot" | wc -c))) < /dev/zero 2>/dev/null | tr '\0' ' ')
		local xpPad=$(head -c $((8-$(echo "$goldGot" | wc -c))) < /dev/zero 2>/dev/null | tr '\0' ' ')
		echo "  +--------------+"
		echo "  | Gold: $((${enemy[1]}/6*7))$goldPad|"
		echo "  | Xp  : ${enemy[1]}$xpPad|"
		echo "  +--------------+"
	fi
}