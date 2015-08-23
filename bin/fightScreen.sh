function fightScreen_ {
	if [[ $hp -lt 10 ]]; then
		hpd="  $hp"
	elif [[ $hp -lt 100 ]]; then
		hpd=" $hp"
	else
		hpd="$hp"
	fi
	if [[ $1 = select ]]; then
		while true; do
			clear
			sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "; sel7=" "; sel8=" "
			vara=sel$sbase; varb=sel$(($sbase+1))
			eval $vara=\"[\"; eval $varb=\"]\"
			echo "+----------------------------+"
			if [[ $(echo "${invl[${inv[0]}]} ${invl[${inv[1]}]} ${invl[${inv[2]}]} ${invl[${inv[3]}]}" | grep "${invl[9]}") ]]; then
				echo "| Enemy Stats: hp: $eHealth, power: ${enemy[1]}"
				echo "| defense: ${enemy[2]}, agility: ${enemy[3]}"
			else
				echo "|                            |"
				echo "|                            |"
			fi
			echo "|      ${enemy[0]} L. ${enemy[6]}"
			echo "|                            |"
			echo "|      ${enemy[5]}              $avatar      |"
			echo "|     -|-                    |"
			echo "|                            |"
			echo "|                            "
			echo "|                            "
			echo "|----------------------------+"
			echo "|$sel1 Fight $sel2 $sel3 Run $sel4 $sel5 Potion $sel6|"
			if [[ $class = 1 ]] || [[ $class = 2 ]]; then
				echo "|$sel7 Magic $sel8                   |"
			else
				echo "|                            |"
			fi
			echo "|----------------------------+"
			echo "| Health: $hpd                |"
			echo "+----------------------------+"
			read -s -n 1 key
			audio_ click
			if [[ -n $key ]]; then
				if [[ $key = d ]]; then
					((sbase=$sbase+2))
				elif [[ $key = a ]]; then
					((sbase=$sbase-2))
				elif [[ $key = u ]]; then
					characterSheet_
				elif [[ $key = i ]]; then
					inventory_
				fi
			else
				if [[ $sbase = 1 ]]; then
					break
				elif [[ $sbase = 3 ]]; then
					potionused=true
					if [[ $((RANDOM%(10+$luck))) -ge 6 ]]; then
						echo "Close Call"
						sleep 0.5
						run=true
						break
					else
						echo "Can't Run!"
						sleep 0.5
						break
					fi
				elif [[ $sbase = 5 ]]; then
					drink_
					break
				elif [[ $sbase = 7 ]]; then
					magic_ use
					if [[ $? = 0 ]]; then
						spellused=true
						break
					fi
				fi
			fi
			if [[ $sbase -lt 1 ]]; then
				sbase=1
			elif [[ $sbase -gt 5 ]]; then
				if [[ $class = 1 ]] || [[ $class = 2 ]]; then
					if [[ $sbase -gt 7 ]]; then
						sbase=7
					fi
				else
					sbase=5
				fi
			fi
		done
	else
		clear
		if [[ $1 = you ]]; then
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      ${enemy[0]} L. ${enemy[6]}"
			echo "|                            |"
			echo "|      ${enemy[5]}              $avatar      |"
			echo "|     -|-                    |"
			echo "|                            |"
			echo "|     $name > ${enemy[0]}"
			echo "|     $yddd                   "
			echo "|----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| Health: $hpd                |"
			echo "+----------------------------+"
		elif [[ $1 = them ]]; then
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      ${enemy[0]} L. ${enemy[6]}"
			echo "|                            |"
			echo "|      ${enemy[5]}              $avatar      |"
			echo "|     -|-                    |"
			echo "|                            |"
			echo "|     ${enemy[0]} > $name"
			echo "|     $tddd                   "
			echo "|----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| Health: $hpd                |"
			echo "+----------------------------+"
		fi
	fi
}