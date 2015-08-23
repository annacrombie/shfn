function ballGame_ {
	function ballGamelaunch_ {
		id=$RANDOM
		if [[ -d /tmp/ball/$id ]]; then
			rm -rf /tmp/ball/$id
		fi
		mkdir -p /tmp/ball/$id
		touch /tmp/ball/$id/lock
		manX=1
		echo "$manX" > /tmp/ball/$id/man
		speed=75
		points=0
		echo "$points" > /tmp/ball/$id/points
		ballGamedrawMan_
		ballGameball_ start all&
		ballGamemain_
	}
	function ballGamegameScreen_ {
		clear
		ball=(" " " " " " " " " " " " " " " " " " " ")
		ballGamedrawMan_
		ballGameball_ getPos
		ball[$ball0Pos]="."
		ball[$ball1Pos]="."
		echo -e "Points: $(cat /tmp/ball/$id/points)\n         ${ball[11]}\n        ${ball[8]}${ball[9]}${ball[10]}\n       ${ball[4]}${ball[5]} ${ball[6]}${ball[7]}\n      ${ball[0]}${ball[1]} n ${ball[2]}${ball[3]}\n      ${arm[0]}""_|_""${arm[1]}\n        ${leg[0]} ${leg[1]}"
		if [[ $(cat /tmp/ball/$id/points) -gt 240 ]]; then
			echo "You win!"
			ballGamecleanUp_
			ballGameDidWin=1
		fi
	}
	function ballGameball_ {
		if [[ $1 = getPos ]]; then
			ball0Pos=$(cat /tmp/ball/$id/pos0)
			ball1Pos=$(cat /tmp/ball/$id/pos1)
		elif [[ $1 = path ]]; then
			if [[ $2 = 0 ]]; then
				echo "0" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "4" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "8" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "9" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "10" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "7" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "3" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				if [[ -f /tmp/ball/$id/lock ]]; then
					if [[ $(cat /tmp/ball/$id/man) = 2 ]]; then
						echo "$(($(cat /tmp/ball/$id/points)+10))" > /tmp/ball/$id/points
						audio_ beep
					else
						echo "Game Over."
						ballGamecleanUp_
						ballGameDidWin=0
					fi
					ballGameball_ path 2 $3
				fi
			elif [[ $2 = 1 ]]; then
				echo "1" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "5" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "9" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "6" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "2" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				if [[ -f /tmp/ball/$id/lock ]]; then
					if [[ $(cat /tmp/ball/$id/man) = 1 ]] || [[ $(cat /tmp/ball/$id/man) = 0 ]]; then
						echo "$(($(cat /tmp/ball/$id/points)+10))" > /tmp/ball/$id/points
						audio_ beep
					else
						echo "Game Over."
						ballGamecleanUp_
						ballGameDidWin=0
					fi
					ballGameball_ path 3 $3
				fi
			elif [[ $2 = 2 ]]; then
				echo "3" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "7" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "10" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "11" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "8" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "4" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "0" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				if [[ -f /tmp/ball/$id/lock ]]; then
					if [[ $(cat /tmp/ball/$id/man) = 0 ]]; then
						echo "$(($(cat /tmp/ball/$id/points)+10))" > /tmp/ball/$id/points
						audio_ beep
					else
						echo "Game Over."
						ballGamecleanUp_
						ballGameDidWin=0
					fi
					ballGameball_ path 0 $3
				fi
			elif [[ $2 = 3 ]]; then
				echo "2" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "6" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "9" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "5" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				echo "1" > /tmp/ball/$id/pos$3
				sleep 0.$speed
				if [[ -f /tmp/ball/$id/lock ]]; then
					if [[ $(cat /tmp/ball/$id/man) = 1 ]] || [[ $(cat /tmp/ball/$id/man) = 2 ]]; then
						echo "$(($(cat /tmp/ball/$id/points)+10))" > /tmp/ball/$id/points
						audio_ beep
					else
						echo "Game Over."
						ballGamecleanUp_
						ballGameDidWin=0
					fi
					ballGameball_ path 1 $3
				fi
			fi
		elif [[ $1 = start ]]; then
			if [[ $2 = 0 ]]; then
				ballGameball_ path $((RANDOM%2))&
			elif [[ $2 = 1 ]]; then
				ballGameball_ path $((RANDOM%2+2))&
			elif [[ $2 = all ]]; then
				echo "12" > /tmp/ball/$id/pos1
				ballGameball_ path $((RANDOM%2)) 0&sleep 1&&ballGameball_ path $((RANDOM%2+2)) 1&
			fi
		fi
	}
	function ballGamedrawMan_ {
		if [[ -n $1 ]]; then
			if [[ $1 = a ]]; then
				((manX--))
			elif [[ $1 = d ]]; then
				((manX++))
			fi
			if [[ $manX -lt 0 ]]; then
				manX=0
			elif [[ $manX -gt 2 ]]; then
				manX=2
			fi
			echo "$manX" > /tmp/ball/$id/man
		else
			manX=$(cat /tmp/ball/$id/man)
			if [[ $manX = 0 ]]; then
				arm[0]='|_'; arm[1]='| '; leg[0]='|'; leg[1]='\'
			elif [[ $manX = 1 ]]; then
				arm[0]=' |'; arm[1]='| '; leg[0]='|'; leg[1]='|'
			elif [[ $manX = 2 ]]; then
				arm[0]=' |'; arm[1]='_|'; leg[0]='/'; leg[1]='|'
			fi
		fi
	}
	function ballGamecleanUp_ {
		rm -rf /tmp/ball/$id/lock
	}
	function ballGamemain_ {
		while [[ -f /tmp/ball/$id/lock ]]; do
			ballGamedrawMan_
			ballGamegameScreen_
			sleep 0.1
		done&
		while [[ -f /tmp/ball/$id/lock ]]; do
			read -s -n 1 key
			ballGamedrawMan_ $key
		done
	}
	ballGamelaunch_
	if [[ $ballGameDidWin = 1 ]]; then
		return 1
	else
		return 0
	fi
}