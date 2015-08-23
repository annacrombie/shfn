function main_ {
	audio_ $level first
	while true; do
		oldlevel=$level
		move_
		effect_ c
		clear
		map_
		if [[ $moved = true ]]; then
			((stat_runs++))
			if [[ $(echo "${inv[@]}" | grep 11) ]] && [[ $level != town ]]; then
				hp=$(($hp+$((RANDOM%2+1))))
				if [[ $hp -gt $mp ]]; then
					hp=$mp
				fi
			fi
			if [[ $level = prison ]]; then
				if [[ $y = 9 ]]; then
					if [[ $x -ge 3 ]] && [[ $x -le 9 ]] && [[ $((RANDOM%3)) = 0 ]]; then
						fight_ guard
						clear
						map_
					fi
				fi
				if [[ $((RANDOM%45)) =  1 ]] && [[ ! $(echo ${inv[@]} | grep 12) ]]; then
					echo "Found Key!"
					inventory_ add 12
				fi
			fi
			if [[ $level = crater ]]; then
				if [[ ${cheese[@]} = "1 1 1 1 1 1" ]]; then
					level=moon
					if [[ ! $(echo ${inv[@]} | grep 16) ]]; then
						inventory_ add 16
					fi
					x=5
					y=3
					posCorrect_ noblock
					anim_ e
				fi
			fi
		fi
		if [[ $((RANDOM%10)) -le 1 ]] && [[ $moved = true ]] && [[ $oldlevel = $level ]] && [[ $level != town ]] && [[ $level != house ]] && [[ $lastfight -gt 3 ]] && [[ $encounterEnemies = true ]] && [[ $level != prison ]]; then
			if [[ $level = tavern ]]; then
				if [[ $((RANDOM%6)) = 0 ]]; then
					log_ "Starting Conversation..."
					conversation_ bar
					clear
					map_
				fi
			else
				if [[ $(echo ${inv[@]} | grep 14) ]]; then
					if [[ $((RANDOM%3)) = 0 ]]; then
						fight_
					fi
				else
					fight_
				fi
				clear
				map_
				moved=false
				lastfight=0
			fi
		else
			((lastfight++))
			if [[ $((RANDOM%45)) = 0 ]] && [[ $moved = true ]]; then
				if [[ $((RANDOM%2)) = 0 ]]; then
					event_ r
					clear
					map_
					moved=false
				else
					berry_ found
				fi
			fi
		fi
	done
}