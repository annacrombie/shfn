function fight_ {
	anim_ e f
	if [[ $level != moon ]] && [[ $level != crater ]]; then
		audio_ fight
	fi
	((stat_fights++))
	potionused=false
	enemy=($(enemyGen_ $1))
	eHealth=${enemy[4]}
	while true; do
		fightScreen_ select
		if [[ $run = true ]]; then
			run=false
			break
		fi
		if [[ ${enemy[3]} -ge $agility ]]; then
			if [[ $((RANDOM%10)) -ge 1 ]]; then
				local rPower=$((RANDOM%$power))
				if [[ $(echo ${inv[@]} | grep 25) ]]; then
					ydd=$((($rPower+$power+${invp[${inv[1]}]}+${invp[25]})/2))
				elif [[ $(echo ${inv[@]} | grep 26) ]]; then
					ydd=$((($rPower+$power+${invp[${inv[1]}]}+${invp[26]})/2))
				else
					ydd=$((($rPower+$power+${invp[${inv[1]}]})/2))
				fi
				log_ "Your Damage: ( rPwr($rPower) + pwr($power) + invp(${invp[${inv[1]}]}) )/ 2 = $ydd"
			else
				ydd=miss
			fi
		else
			if [[ $((RANDOM%10)) -ge 3 ]]; then
				local rPower=$((RANDOM%$power))
				if [[ $(echo ${inv[@]} | grep 25) ]]; then
					ydd=$((($rPower+$power+${invp[${inv[1]}]}+${invp[25]})/2))
				elif [[ $(echo ${inv[@]} | grep 26) ]]; then
					ydd=$((($rPower+$power+${invp[${inv[1]}]}+${invp[26]})/2))
				else
					ydd=$((($rPower+$power+${invp[${inv[1]}]})/2))
				fi
				log_ "Your Damage: ( rPwr($rPower) + pwr($power) + invp(${invp[${inv[1]}]}) )/ 2 = $ydd"
			else
				ydd=miss
			fi
		fi
		if [[ ${enemy[3]} -ge $agility ]]; then
			if [[ $((RANDOM%10)) -ge 4 ]]; then
				local tPower=$((RANDOM%${enemy[1]}))
				tdd=$((($tPower+${enemy[1]})/2))
				log_ "Their Damage: ( rPwr($tPower) + pwr(${enemy[1]}) / 2 = $tdd"
			else
				tdd=miss
			fi
		else
			if [[ $((RANDOM%10)) -ge 1 ]]; then
				local tPower=$((RANDOM%${enemy[1]}))
				tdd=$((($tPower+${enemy[1]})/2))
				log_ "Their Damage: ( rPwr($tPower) + pwr(${enemy[1]}) / 2 = $tdd"
			else
				tdd=miss
			fi
		fi
		if [[ $((RANDOM%2)) = 0 ]]; then
			damage_ them
			if [[ $hp -lt 1 ]]; then
				death_
			fi
			damage_ you
			if [[ $eHealth -lt 1 ]]; then
				victory_
				break
			fi
		else
			damage_ you
			if [[ $eHealth -lt 1 ]]; then
				victory_ $1
				break
			fi
			damage_ them
			if [[ $hp -lt 1 ]]; then
				death_
				break
			fi
		fi
	done
	anim_ e fo
}