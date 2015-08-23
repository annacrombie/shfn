function posCorrect_ {
	maps_
	if [[ $1 != noblock ]]; then
		eval "block=\${map$y[$x]}"
	else
		block=' '
	fi
	if [[ $block = "X" ]]; then
		if [[ $level = overworld ]]; then
			audio_ castle
			level=castle
			x=15
			y=14
			anim_ e
			posCorrect_ noblock
		elif [[ $level = castle ]]; then
			audio_ overworld
			level=overworld
			x=4
			y=11
			block=" "
			anim_ e
			posCorrect_ noblock
		elif [[ $level = town ]]; then
			audio_ overworld
			level=overworld
			x=18
			y=6
			block=" "
			anim_ e
			posCorrect_ noblock
		elif [[ $level = rtown ]]; then
			audio_ random
			level=random
			x=$randomTownX
			y=$randomTownY
			block=" "
			anim_ e
			posCorrect_ noblock
		elif [[ $level = fort ]]; then
			audio_ overworld
			level=overworld
			x=20
			y=13
			block=" "
			anim_ e
			posCorrect_ noblock
		elif [[ $level = house ]]; then
			audio_ overworld
			level=overworld
			x=2
			y=12
			block=" "
			anim_ e
			posCorrect_ noblock
		elif [[ $level = tavern ]]; then
			audio_ overworld
			level=overworld
			x=7
			y=4
			block=" "
			anim_ e
			posCorrect_ noblock
		fi
	elif [[ $block = "M" ]]; then
			moonfight=true
			fight_ moon
			moonfight=false
	elif [[ $block = "T" ]]; then
		if [[ $level = random ]]; then
			audio_ rtown
			level=rtown
			x=12
			y=14
			anim_ e
			posCorrect_ noblock
		else
			audio_ town
			level=town
			x=12
			y=14
			anim_ e
			posCorrect_ noblock
		fi
	elif [[ $block = F ]]; then
			level=fort
			x=15
			y=14
			anim_ e
			posCorrect_ noblock
	elif [[ $block = "B" ]]; then
		bossfight=true
		fight_ boss
		bossfight=false
	elif [[ $block = "C" ]]; then
		audio_ chest
		if [[ $level = house ]]; then
			if [[ $x = 21 ]] && [[ $y = 11 ]]; then
				chest[4]=1
				loot_ c
			elif [[ $x = 8 ]] && [[ $y = 11 ]]; then
				chest[3]=1
				loot_ wc
			fi
		else
			if [[ $x = 13 ]] && [[ $y = 6 ]]; then
				chest[0]=1
			elif [[ $x = 18 ]] && [[ $y = 7 ]]; then
				chest[1]=1
			elif [[ $x = 6 ]] && [[ $y = 13 ]]; then
				chest[2]=1
			fi
			loot_ c
		fi
		posCorrect_ noblock
	elif [[ $block = "S" ]]; then
		anim_ e
		shop_
		anim_ e
	elif [[ $block = "I" ]]; then
		anim_ e
		inn_
		anim_ e
	elif [[ $block = "P" ]]; then
		conversation_ townperson
	elif [[ $block = "G" ]]; then
		anim_ e
		gamble_
		anim_ e
	elif [[ $block = "W" ]]; then
		conversation_ witch
		events[4]=1
	elif [[ $block = "o" ]]; then
		if [[ $((RANDOM%20)) = 0 ]]; then
			if [[ $level = crater ]]; then
				audio_ inception
				if [[ ! $(echo ${inv[@]} | grep 19) ]]; then
					inventory_ add 19
				else
					sleep 2
				fi
			fi
			audio_ moon
			level=crater
			cheese=("0" "0" "0" "0" "0" "0")
			anim_ e
			x=14
			y=13
			posCorrect_ noblock
		fi
	elif [[ $level = overworld ]] && [[ $x = 1 ]] && [[ $y = 12 ]]; then
		level=house
		audio_ house
		x=15
		y=14
		anim_ e
		posCorrect_ noblock
	elif [[ $block = "E" ]]; then
		audio_ town
		level=town
		x=12
		y=14
		anim_ e
		posCorrect_ noblock
	elif [[ $block = "c" ]]; then
		echo "You found some cheese!"
		space_
		if [[ $y = 12 ]]; then
			cheese[0]=1
		elif [[ $y = 10 ]]; then
			cheese[1]=1
		elif [[ $y = 8 ]]; then
			cheese[2]=1
		elif [[ $y = 7 ]]; then
			cheese[3]=1
		elif [[ $y = 4 ]]; then
			cheese[4]=1
		elif [[ $y = 2 ]]; then
			cheese[5]=1
		fi
	elif [[ $block = "K" ]]; then
		anim_ e 
		bank_
		anim_ e
	elif [[ $level = overworld ]] && [[ $y -lt 0 ]]; then
		randomTerrain_
		level="random"
		x=$randomSpawnX
		y=15
		posCorrect_
	elif [[ $level = random ]] && [[ $y -gt 15 ]]; then
		level=overworld
		y=0
		x=8
		posCorrect_
	elif [[ $block = "t" ]]; then
		level=tavern
		audio_ tavern
		x=24
		y=14
		anim_ e
		posCorrect_ noblock
	elif [[ $block = "U" ]]; then
		anim_ e 
		barShop_
		anim_ e
	fi
	if [[ $block = ' ' ]]; then
		eval map$oldy[\$oldx]=\"$block\"
		eval map$y[\$x]=\"$avatar\"
	else
		if [[ $block = "D" ]]; then
			if [[ $level = prison ]] && [[ $(echo ${inv[@]} | grep 12) ]]; then
				eval map$oldy[\$oldx]=\"$block\"
				eval map$y[\$x]=\"$avatar\"
			fi
		else
			moved=false
			x=$oldx; y=$oldy
			eval map$y[\$x]=\"$avatar\"
		fi
	fi
	log_ position
}