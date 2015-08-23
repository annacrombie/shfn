function effect_ {
	if [[ $1 = a ]]; then
		if [[ ${effects[$2]} = 0 ]]; then
			effects[$2]=1
			effectd[$2]=$((RANDOM%25+10))
			if [[ $2 = 0 ]]; then
				old_agility=$agility
				old_power=$power
				old_intelect=$intelect
				old_defense=$defense
			fi
		fi
		echo "You got ${effectn[$2]}!"
		space_
	elif [[ $1 = c ]]; then
		for ((i=0;i<${#effects[@]};i++)); do
			if [[ ${effects[$i]} = 1 ]]; then
				if [[ $i = 0 ]]; then 
					agility=$((RANDOM%101+1))
					power=$((RANDOM%101+1))
					intelect=$((RANDOM%101+1))
					defense=$((RANDOM%101+1))
				elif [[ $i = 1 ]]; then
					hp=$(($hp-($((RANDOM%3))+1)))
					if [[ $hp -lt 1 ]]; then
						hp=1
					fi
				elif [[ $i = 2 ]]; then
					hp=$(($hp+$drinksHad))
					magicPoints=$(($magicPoints+1))
					if [[ $magicPoints -gt $mmagicPoints ]]; then
						magicPoints=$mmagicPoints
					fi
					if [[ $drinksHad -gt 3 ]]; then
						if [[ $((RANDOM%$drinksHad)) -gt 3 ]] && [[ ${effects[3]} = 0 ]]; then
							effect_ a 3
						fi
					elif [[ $drinksHad -gt 10 ]] && [[ ${effects[3]} = 0 ]]; then
						effect_ a 3
					fi
				elif [[ $i = 3 ]]; then
					hp=$(($hp-$((RANDOM%30))))
					if [[ $hp -lt 1 ]]; then
						death_
					fi
				fi
				effectd[$i]=$((${effectd[$i]}-1))
				if [[ ${effectd[$i]} = 0 ]]; then
					effects[$i]=0
					if [[ $i = 0 ]]; then
						agility=$old_agility
						power=$old_power
						intelect=$old_intelect
						defense=$old_defense
					fi
					echo "${effectn[$i]} wore off"
					if [[ $i = 2 ]]; then
						drinksHad=0
					fi
					space_
				fi
			fi
		done
	elif [[ $1 = d ]]; then
		effectFirst=true
		isEffect=false
		for ((i=0;i<${#effects[@]};i++)); do
			if [[ ${effects[$i]} = 1 ]]; then
				if [[ $effectFirst != true ]]; then
					echo -n ", "
				else
					effectFirst=false
				fi
				echo -n "${effectn[$i]}"
				if [[ $(echo "${invl[${inv[0]}]} ${invl[${inv[1]}]} ${invl[${inv[2]}]} ${invl[${inv[3]}]}" | grep "${invl[9]}") ]]; then
					echo -n " (${effectd[$i]})"
				fi
				isEffect=true
			fi
		done
		if [[ $isEffect = false ]]; then
			echo "none"
		fi
	fi
}