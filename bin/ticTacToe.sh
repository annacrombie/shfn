function ticTacToe_ {
	p=(" " " " " " " " " " " " " " " " " ")
	sx=0; sy=0;
	turn=0
	while true; do
		clear
		sx0y0=" "; sx1y0=" "; sx2y0=" "; sx3y0=" "; sx4y0=" "; sx5y0=" ";
		sx0y1=" "; sx1y1=" "; sx2y1=" "; sx3y1=" "; sx4y1=" "; sx5y1=" ";
		sx0y2=" "; sx1y2=" "; sx2y2=" "; sx3y2=" "; sx4y2=" "; sx5y2=" ";
		vara="sx"$sx"y"$sy; varb="sx"$(($sx+1))"y"$sy
		eval $vara=\"[\"; eval $varb=\"]\"
		echo "+----------------------------+"
		echo "|         |       |          |"
		echo "|   $sx0y0 ${p[0]} $sx1y0 | $sx2y0 ${p[1]} $sx3y0 | $sx4y0 ${p[2]} $sx5y0    |"
		echo "|         |       |          |"
		echo "|  -------+-------+-------   |"
		echo "|         |       |          |"
		echo "|   $sx0y1 ${p[3]} $sx1y1 | $sx2y1 ${p[4]} $sx3y1 | $sx4y1 ${p[5]} $sx5y1    |"
		echo "|         |       |          |"
		echo "|  -------+-------+-------   |"
		echo "|         |       |          |"
		echo "|   $sx0y2 ${p[6]} $sx1y2 | $sx2y2 ${p[7]} $sx3y2 | $sx4y2 ${p[8]} $sx5y2    |"
		echo "|         |       |          |"
		echo "|                            |"
		echo "|----------------------------+"
		echo "|                            |"
		echo "|                            |"
		echo "+----------------------------+"
		read -s -n 1 key
		audio_ click
		if [[ -n $key ]]; then
			if [[ $key = w ]]; then
				((sy--))
			elif [[ $key = s ]]; then
				((sy++))
			elif [[ $key = a ]]; then
				((sx=$sx-2))
			elif [[ $key = d ]]; then
				((sx=$sx+2))
			fi
		else
			if [[ $sx = 0 ]]; then
				if [[ $sy = 0 ]]; then
					pNum=0
				elif [[ $sy = 1 ]]; then
					pNum=3
				elif [[ $sy = 2 ]]; then
					pNum=6
				fi
			elif [[ $sx = 2 ]]; then
				if [[ $sy = 0 ]]; then
					pNum=1
				elif [[ $sy = 1 ]]; then
					pNum=4
				elif [[ $sy = 2 ]]; then
					pNum=7
				fi
			elif [[ $sx = 4 ]]; then
				if [[ $sy = 0 ]]; then
					pNum=2
				elif [[ $sy = 1 ]]; then
					pNum=5
				elif [[ $sy = 2 ]]; then
					pNum=8
				fi
			fi
			if [[ ${p[$pNum]} = ' ' ]]; then
				p[$pNum]="X"
				if [[ ${p[0]} = X ]] && [[ ${p[1]} = X ]] && [[ ${p[2]} = X ]]; then
					yWin=true; break
				elif [[ ${p[3]} = X ]] && [[ ${p[4]} = X ]] && [[ ${p[5]} = X ]]; then
					yWin=true; break
				elif [[ ${p[6]} = X ]] && [[ ${p[7]} = X ]] && [[ ${p[8]} = X ]]; then
					yWin=true; break
				elif [[ ${p[0]} = X ]] && [[ ${p[3]} = X ]] && [[ ${p[6]} = X ]]; then
					yWin=true; break
				elif [[ ${p[1]} = X ]] && [[ ${p[4]} = X ]] && [[ ${p[7]} = X ]]; then
					yWin=true; break
				elif [[ ${p[2]} = X ]] && [[ ${p[5]} = X ]] && [[ ${p[8]} = X ]]; then
					yWin=true; break
				elif [[ ${p[0]} = X ]] && [[ ${p[4]} = X ]] && [[ ${p[8]} = X ]]; then
					yWin=true; break
				elif [[ ${p[2]} = X ]] && [[ ${p[4]} = X ]] && [[ ${p[6]} = X ]]; then
					yWin=true; break
				fi
				atw=false
				if [[ ${p[0]} = X ]] && [[ ${p[1]} = X ]]; then
					atw=true; wPc=2
				elif [[ ${p[1]} = X ]] && [[ ${p[2]} = X ]]; then
					atw=true; wPc=0
				elif [[ ${p[0]} = X ]] && [[ ${p[2]} = X ]]; then
					atw=true; wPc=1
				elif [[ ${p[3]} = X ]] && [[ ${p[4]} = X ]]; then
					atw=true; wPc=5
				elif [[ ${p[4]} = X ]] && [[ ${p[5]} = X ]]; then
					atw=true; wPc=3
				elif [[ ${p[3]} = X ]] && [[ ${p[5]} = X ]]; then
					atw=true; wPc=4
				elif [[ ${p[6]} = X ]] && [[ ${p[7]} = X ]]; then
					atw=true; wPc=8
				elif [[ ${p[7]} = X ]] && [[ ${p[8]} = X ]]; then
					atw=true; wPc=6
				elif [[ ${p[6]} = X ]] && [[ ${p[8]} = X ]]; then
					atw=true; wPc=7
				elif [[ ${p[0]} = X ]] && [[ ${p[3]} = X ]]; then
					atw=true; wPc=6
				elif [[ ${p[3]} = X ]] && [[ ${p[6]} = X ]]; then
					atw=true; wPc=0
				elif [[ ${p[0]} = X ]] && [[ ${p[6]} = X ]]; then
					atw=true; wPc=3
				elif [[ ${p[1]} = X ]] && [[ ${p[4]} = X ]]; then
					atw=true; wPc=7
				elif [[ ${p[4]} = X ]] && [[ ${p[7]} = X ]]; then
					atw=true; wPc=1
				elif [[ ${p[1]} = X ]] && [[ ${p[7]} = X ]]; then
					atw=true; wPc=4
				elif [[ ${p[2]} = X ]] && [[ ${p[5]} = X ]]; then
					atw=true; wPc=8
				elif [[ ${p[5]} = X ]] && [[ ${p[8]} = X ]]; then
					atw=true; wPc=2
				elif [[ ${p[2]} = X ]] && [[ ${p[8]} = X ]]; then
					atw=true; wPc=5
				elif [[ ${p[0]} = X ]] && [[ ${p[4]} = X ]]; then
					atw=true; wPc=8
				elif [[ ${p[4]} = X ]] && [[ ${p[8]} = X ]]; then
					atw=true; wPc=0
				elif [[ ${p[0]} = X ]] && [[ ${p[8]} = X ]]; then
					atw=true; wPc=4
				elif [[ ${p[2]} = X ]] && [[ ${p[4]} = X ]]; then
					atw=true; wPc=5
				elif [[ ${p[2]} = X ]] && [[ ${p[6]} = X ]]; then
					atw=true; wPc=4
				elif [[ ${p[4]} = X ]] && [[ ${p[6]} = X ]]; then
					atw=true; wPc=2
				fi
				if [[ $atw = true ]]; then
					if [[ $((RANDOM%10)) -ge 2 ]] && [[ ${p[$wPc]} = ' ' ]]; then
						p[$wPc]=O
						eP=$wPc
					else
						placed=false
						for ((i=0;i<9;i++)); do
							if [[ ${p[$i]} = ' ' ]]; then
								p[$i]=O
								eP=$i
								placed=true
								break
							fi
						done
						if [[ $placed = false ]]; then
							yWin=draw
							break
						fi
					fi
				else
					placed=false
					for ((i=0;i<9;i++)); do
						if [[ ${p[$i]} = ' ' ]]; then
							p[$i]=O
							eP=$i
							placed=true
							break
						fi
					done
					if [[ $placed = false ]]; then
						yWin=draw
						break
					fi
				fi
				if [[ ${p[0]} = O ]] && [[ ${p[1]} = O ]] && [[ ${p[2]} = O ]]; then
					yWin=false; break
				elif [[ ${p[3]} = O ]] && [[ ${p[4]} = O ]] && [[ ${p[5]} = O ]]; then
					yWin=false; break
				elif [[ ${p[6]} = O ]] && [[ ${p[7]} = O ]] && [[ ${p[8]} = O ]]; then
					yWin=false; break
				elif [[ ${p[0]} = O ]] && [[ ${p[3]} = O ]] && [[ ${p[6]} = O ]]; then
					yWin=false; break
				elif [[ ${p[1]} = O ]] && [[ ${p[4]} = O ]] && [[ ${p[7]} = O ]]; then
					yWin=false; break
				elif [[ ${p[2]} = O ]] && [[ ${p[5]} = O ]] && [[ ${p[8]} = O ]]; then
					yWin=false; break
				elif [[ ${p[0]} = O ]] && [[ ${p[4]} = O ]] && [[ ${p[8]} = O ]]; then
					yWin=false; break
				elif [[ ${p[2]} = O ]] && [[ ${p[4]} = O ]] && [[ ${p[6]} = O ]]; then
					yWin=false; break
				fi
			fi
		fi
		if [[ $sx -gt 4 ]]; then
			sx=4
		elif [[ $sx -lt 0 ]]; then
			sx=0
		fi
		if [[ $sy -gt 2 ]]; then
			sy=2
		elif [[ $sy -lt 0 ]]; then
			sy=0
		fi
	done
	if [[ $yWin = true ]]; then
		echo "You Win!"
		space_
		return 0
	elif [[ $yWin = false ]]; then
		echo "You Lose!"
		space_
		return 1
	else
		echo "Its a draw!"
		space_
		return 2
	fi
}