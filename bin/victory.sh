function victory_ {
	((stat_wins++))
	clear
	echo " +-------------------+"
	echo " |   Victory!!!!!    |"
	echo " +-------------------+"
	loot_
	if [[ $level != moon ]] && [[ $level != crater ]]; then
		audio_ fanfare
	fi
	space_
	while true; do
		if [[ $xp -ge $(($lvl*110)) ]]; then
			levelUp_
		else
			break
		fi
	done
	if [[ $level = tavern ]]; then
		if [[ $((RANDOM%(15-$luck))) = 0 ]]; then
			echo "Drunk dropped ${invl[20]}"
			inventory_ add 20
		fi
	else
		if [[ $((RANDOM%(35-$luck))) = 0 ]]; then
			item=$((RANDOM%${#drops[@]}))
			echo "${enemy[0]} dropped ${invl[${drops[$item]}]}"
			inventory_ add ${drops[$item]}
		fi
		if [[ ${events[4]} = 1 ]] && [[ $((RANDOM%(12-$luck))) = 0 ]] && [[ ! $(echo ${inv[@]} | grep 7) ]] && [[ ${events[5]} = 0 ]]; then
			echo "${enemy[0]} dropped herb"
			space_
			inventory_ add 7
		fi
	fi
	if [[ $bossfight = true ]]; then
		((boss++))
		if [[ $boss = 2 ]]; then
			win_
		fi
	elif [[ $moonfight = true ]]; then
		audio_ overworld
		level=overworld
		x=18
		y=6
		block=" "
		anim_ e
		posCorrect_ noblock
	elif [[ $witchfight = true ]]; then
		events[6]=1
	fi
	if [[ $((RANDOM%(25+$luck))) = 0 ]] && [[ $level != moon ]] && [[ ${events[0]} = 0 ]]; then
		events[0]=1
		echo "a moon vortex has opened!!!"
		level=moon
		x=5
		y=3
		posCorrect_
		space_
	fi
}