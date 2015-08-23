function bonusChance_ {
	sx=1
	bet=$1
	while true; do
		clear
		sel1=" "; sel2=" "; sel3=" "; sel4=" "
		vara=sel$sx
		eval $vara=\"U\"
		echo "+----------------------------+"
		echo "|                            |"
		echo "|      M               @     |"
		echo "|     -|-             -|-    |"
		echo "|----------------------------+"
		echo "|                            |"
		echo '|             / \            |'
		echo '|            /   \           |'
		echo '|           /     \          |'
		echo '|          /\     /\         |'
		echo '|         /  \   /  \        |'
		echo "|        $sel1    $sel2 $sel3   $sel4        |"
		echo "|----------------------------+"
		echo "| Gold: $gold, q to quit"
		echo "+----------------------------+"
		read -s -n 1 key
		if [[ -n $key ]]; then
			audio_ beep
			if [[ $key = d ]]; then
				((sx++))
			elif [[ $key = a ]]; then
				((sx--))
			elif [[ $key = q ]]; then
				break
			fi
		else
			audio_ beep
			tput cup 5 15
			echo -n "*"
			sleep 0.25
			tput cup 5 15
			echo -n " "
			if [[ $((RANDOM%2)) = 0 ]]; then
				audio_ beep
				tput cup 7 11
				echo -n "*"
				sleep 0.25
				tput cup 7 11
				echo -n " "
				if [[ $((RANDOM%2)) = 0 ]]; then
					audio_ beep
					cup_final=2
					tput cup 10 14
					echo -n "*"
					sleep 0.25
					tput cup 10 14
					echo -n " "
				else
					audio_ beep
					cup_final=1
					tput cup 10 9
					echo -n "*"
					sleep 0.25
					tput cup 10 9
					echo -n " "
				fi
			else
				audio_ beep
				tput cup 8 19
				echo -n "*"
				sleep 0.25
				tput cup 8 19
				echo -n " "
				if [[ $((RANDOM%2)) = 0 ]]; then
					audio_ beep
					cup_final=4
					tput cup 10 21
					echo -n "*"
					sleep 0.25
					tput cup 10 21
					echo -n " "
				else
					audio_ beep
					cup_final=3
					tput cup 10 18
					echo -n "*"
					sleep 0.25
					tput cup 10 18
					echo -n " "
				fi
			fi
			if [[ $cup_final = $sx ]]; then
				tput cup 15 0
				echo "Winner"
				audio_ chest
				((gold=$gold+$bet))
				space_
			else
				tput cup 15 0
				echo "Loser"
				((gold=$gold-$bet))
				space_
				if [[ $gold -lt $bet ]]; then
					break
				fi
			fi
		fi
		if [[ $sx -gt 4 ]]; then
			sx=4
		elif [[ $sx -lt 1 ]]; then
			sx=1
		fi
	done
}