function inn_ {
	while true; do
		clear
		sel1=" "; sel2=" "; sel3=" "; sel4=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo "+----------------------------+"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|    0  | @                  |"
		echo "|   -|- |-|-                 |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|       |                    |"
		echo "|----------------------------+"
		echo "| 100 Gold, ok?              |"
		echo "|$sel1 Yes $sel2 $sel3 No $sel4              |"
		echo "|----------------------------+"
		echo "| Health: $hp/$mp Gold: $gold"
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
					gold=$(($gold-100))
					hp=$mp
					magicPoints=$mmagicPoints
					clear
					echo "+----------------------------+"
					echo "|       |                    |"
					echo "|       |                    |"
					echo "|       |                    |"
					echo "|    0  | @                  |"
					echo "|   -|- |-|-                 |"
					echo "|       |                    |"
					echo "|       |                    |"
					echo "|       |                    |"
					echo "|       |                    |"
					echo "|----------------------------+"
					echo "| 100 Gold, ok?              |"
					echo "|$sel1 Yes $sel2 $sel3 No $sel4              |"
					echo "|----------------------------+"
					echo "| Health: $hp/$mp Gold: $gold"
					echo "+----------------------------+"
					audio_ chest
					echo "You feel well rested"
					space_
					break
				else
					echo "Come back when you can pay"
					space_
					break
				fi
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
}