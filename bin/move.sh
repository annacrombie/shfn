function move_ {
	oldx=$x; oldy=$y
	read -s -n 1 key
	if [[ $key = f ]] || [[ $key = m ]]; then
		justSaved=true
	else
		justSaved=false
	fi
	if [[ -n $key ]]; then
		if [[ $key = w ]]; then
			audio_ walk
			((y--))
			moved=true
		elif [[ $key = s ]]; then
			audio_ walk
			((y++))
			moved=true
		elif [[ $key = a ]]; then
			audio_ walk
			((x--))
			moved=true
		elif [[ $key = d ]]; then
			audio_ walk
			((x++))
			moved=true
		elif [[ $key = t ]]; then
			moved=false
			audio_ click
			if [[ $statDisplay = true ]]; then
				statDisplay=false
			elif [[ $statDisplay = false ]]; then
				statDisplay=true
			fi
		elif [[ $key = h ]]; then
			moved=false
			anim_ e
			help_
			anim_ e
		elif [[ $key = u ]]; then
			moved=false
			characterSheet_
		elif [[ $key = m ]]; then
			while true; do
				sel1=" "; sel2=" "; sel3=" "; sel4=" ";
				vara=sel$sbase; varb=sel$(($sbase+1))
				eval $vara=\"[\"; eval $varb=\"]\"
				echo -en "\rExit without saving? $sel1 yes $sel2 $sel3 no $sel4"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						launch_
					else
						moved=false
					fi
					break
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 3 ]]; then
					sbase=3
				fi
			done
		elif [[ $key = p ]]; then
			moved=false
			drink_
		elif [[ $key = f ]]; then
			moved=false
			save_
			stats_ save
			echo "SAVED"
			space_
		elif [[ $key = c ]]; then
			read -p ">>> " cheat
			cheat_ $cheat
		elif [[ $key = i ]]; then
			inventory_
		elif [[ $key = b ]]; then
			echo -n "b"
			read -s -n 1 key
			if [[ $key = a ]]; then
				echo -n "a"
				read -s -n 1 key
				if [[ $key = l ]]; then
					echo -n "l"
					read -s -n 1 key
					if [[ $key = l ]]; then
						echo -n "l"
						read -s -n 1 key
						echo -n "!"
						echo ""
						ballGame_
					fi
				fi
			fi
		elif [[ $key = r ]] && [[ $developer = true ]]; then
			echo "Reloading..."
			reload_
		fi
		if [[ $moved = true ]] && [[ ${effects[2]} = 1 ]] && [[ $level != overworld ]] && [[ $level != random ]] && [[ $level != moon ]]; then
			if [[ $((RANDOM%3)) -gt 0 ]]; then
				movement=$((RANDOM%$drinksHad+1/3))
				if [[ $((RANDOM%2)) = 0 ]]; then
					if [[ $((RANDOM%2)) = 0 ]]; then
						x=$(($x+$movement))
					else
						x=$(($x-$movement))
					fi
				else
					if [[ $((RANDOM%2)) = 0 ]]; then
						y=$(($y+$movement))
					else
						y=$(($y-$movement))
					fi
				fi
			fi
		fi
		posCorrect_
	fi
}