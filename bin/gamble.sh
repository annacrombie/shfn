function gamble_ {
	while true; do
		clear
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo "+----------------------------+"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|    0  |  @                 |"
		echo "|   -|- | -|-                |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|----------------------------+"
		echo "| Whats your bet?            |"
		echo "|$sel1 100 $sel2$sel3 1000 $sel4$sel5 Cancel $sel6   |"
		echo "|----------------------------+"
		echo "| Gold: $gold"
		echo "+----------------------------+"
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
				if [[ $gold -ge 100 ]]; then
					local bet=100
					break
				else
					echo "Come back when you can pay"
					space_
					break
				fi
			elif [[ $sbase = 3 ]]; then
				if [[ $gold -ge 1000 ]]; then
					local bet=1000
					break
				else
					echo "Come back when you can pay"
					space_
					break
				fi
			elif [[ $sbase = 5 ]]; then
				break
			fi
		fi
		if [[ $sbase -lt 1 ]]; then
			sbase=1
		elif [[ $sbase -gt 5 ]]; then
			sbase=5
		fi
	done
	if [[ -n $bet ]]; then
		while true; do
			clear
			sel1=" "; sel2=" "; sel3=" "; sel4=" "
			vara=sel$sbase; varb=sel$(($sbase+1))
			eval $vara=\"[\"; eval $varb=\"]\"
			echo "+----------------------------+"
			echo "|       |                    |"
			echo "|       |                    |"
			echo "|       |                    |"
			echo "|    0  |  @                 |"
			echo "|   -|- | -|-                |"
			echo "| Place the cup where you    |"
			echo "| think the ball will fall.  |"
			echo "| Press q when you are done. |"
			echo "|----------------------------+"
			echo "| Still want to play?        |"
			echo "|                            |"
			echo "|$sel1 Yes $sel2 $sel3 No $sel4              |"
			echo "|----------------------------+"
			echo "| Gold: $gold"
			echo "+----------------------------+"
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
					bonusChance_ $bet
					break
				elif [[ $sbase = 3 ]]; then
					break
				fi
			fi
			if [[ $sbase -lt 1 ]]; then
				sbase=1
			elif [[ $sbase -gt 3 ]]; then
				sbase=3
			fi
		done
	fi
	echo "Come back soon!"
	space_
}