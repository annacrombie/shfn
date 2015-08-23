function randomTerrain_ {
	if [[ ! -f ./save/terrain$saveSlot ]] || [[ $1 = force ]]; then
		oceanMin=$((RANDOM%5+3))
		continentMax=$((RANDOM%8+11))
		taper=$((RANDOM%3+2))
		mountains=$((RANDOM%4+1))
		town=$((RANDOM%13+1))
		castle=$((RANDOM%13+1))
		slant=$((RANDOM%2))
		for ((y=0;y<16;y++)); do
			oldOceanLen=$oceanLen
			oceanLen=0
			oldContinentLen=$continentLen
			continentLen=0
			continentFin=false
			if [[ $y -gt $taper ]]; then
				if [[ $slant = 0 ]]; then
					((oceanMin++))
				fi
				((continentMax--))
			fi
			for ((x=0;x<30;x++)); do
				if [[ $continentFin = true ]]; then
					block="≈"
				else
					if [[ $y = 15 ]]; then
						block="≈"
					elif [[ $x -lt $oceanMin ]]; then
						block="≈"
						((oceanLen++))
					elif [[ $x -gt $oceanMin ]] && [[ $lastBlock = "≈" ]]; then
						if [[ $oceanLen -lt $oldOceanLen ]]; then
							if [[ $oceanLen -gt $(($oldOceanLen+2)) ]]; then
								block="#"
								((continentLen++))
							else
								block="≈"
								((oceanLen++))
							fi
						else
							if [[ $((RANDOM%($y+1))) -gt 5 ]]; then
								block="≈"
								((oceanLen++))
							else
								block="#"
								((continentLen++))
							fi
						fi
					elif [[ $lastBlock = "#" ]]; then
						block=" "
						((continentLen++))
					elif [[ $lastBlock = " " ]]; then
						if [[ $(($x-$oceanLen)) -lt $continentMax ]]; then
							if [[ $(($x-$oceanLen)) -lt $(($continentMax+2)) ]]; then
								block=" "
								((continentLen++))
							else
								block="#"
								continentFin=true
							fi
						else
							if [[ $((RANDOM%3)) != 0 ]]; then
								block="#"
								continentFin=true
							else
								block=" "
								((continentLen++))
							fi
						fi
					fi
				fi
				if [[ $y = 14 ]] && [[ $block = "#" ]]; then
					blockToPlace="≈"
				fi
				lastBlock=$block
				blockToPlace="$block"
				if [[ $y -le $mountains ]] && [[ $block = " " ]]; then
					if [[ $y = 0 ]]; then
						if [[ $((RANDOM%2)) = 0 ]]; then
							blockToPlace="^"
						fi
					elif [[ $y = 1 ]]; then
						if [[ $((RANDOM%3)) = 0 ]]; then
							blockToPlace="^"
						fi
					elif [[ $y = 2 ]]; then
						if [[ $((RANDOM%6)) = 0 ]]; then
							blockToPlace="^"
						fi
					elif [[ $y = 3 ]]; then
						if [[ $((RANDOM%8)) = 0 ]]; then
							blockToPlace="^"
						fi
					fi
				elif [[ $y = 14 ]]; then
					if [[ $block = " " ]]; then
						blockToPlace="#"
					fi
				fi
				if [[ $y = $town ]] && [[ $block = " " ]]; then
					if [[ $((RANDOM%2)) = 0 ]]; then
						blockToPlace="T"
						randomTownX=$x
						randomTownY=$y
						town=-1
					fi
				fi
				if [[ $y = $castle ]] && [[ $block = " " ]]; then
					if [[ $((RANDOM%2)) = 0 ]]; then
						blockToPlace="X"
						randomCastleX=$x
						randomCastleY=$y
						castle=-1
					fi
				fi
				if [[ $blockToPlace = "≈" ]] && [[ -z $hasIsland ]]; then
					if [[ $((RANDOM%200)) = 0 ]]; then
						blockToPlace="#"
						hasIsland=true
					fi
				fi
				eval random$y[\$x]=\"$blockToPlace\"
			done
		done
		randomSpawnX=undefined
		while [[ $randomSpawnX = undefined ]]; do
			randomSpawnX=undefined
			for ((i=0;i<30;i++)); do
				if [[ ${random0[$i]} = " " ]]; then
					if [[ $((RANDOM%3)) -gt 0 ]]; then
						randomSpawnX=$i
						randomSpawnY=4
					fi
				fi
			done
		done
		if [[ $1 != force ]]; then
			save_ terrain
		fi
	else
		load_ terrain
	fi
}