function inventory_ {
	if [[ -z $1 ]]; then
		echo "0) ${invl[${inv[0]}]}  <- Equipped Weapon"
		echo "1) ${invl[${inv[1]}]}  <- Equipped Armour"
		echo "2) ${invl[${inv[2]}]}"
		echo "3) ${invl[${inv[3]}]}"
		while true; do
			sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "; sel7=" "; sel8=" "
			vara=sel$sbase; varb=sel$(($sbase+1))
			eval $vara=\"[\"; eval $varb=\"]\"
			echo -en "\r$sel1 Swap $sel2 $sel3 Drop $sel4 $sel5 Use $sel6 $sel7 Berry Pouch $sel8 $sel9 Cancel $sel10"
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
					local invMode=0
				elif [[ $sbase = 3 ]]; then
					local invMode=1
				elif [[ $sbase = 5 ]]; then
					local invMode=2
				elif [[ $sbase = 7 ]]; then
					local invMode=3
				fi
				break
			fi
			if [[ $sbase -lt 1 ]]; then
				sbase=1
			elif [[ $sbase -gt 9 ]]; then
				sbase=9
			fi
		done
		echo ""
		if [[ $invMode = 0 ]]; then
			read -p "Item to swap: " swapA
			read -p "Item to swap with: " swapB
			if [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]] || [[ $swapA = 0 ]]; then
				if [[ $swapB = 1 ]] || [[ $swapB = 2 ]] || [[ $swapB = 3 ]] || [[ $swapB = 0 ]]; then
					if [[ $swapA = 0 ]] || [[ $swapB = 0 ]]; then
						if [[ $agility -lt ${minAgi[${inv[$swapA]}]} ]] || [[ $agility -lt ${minAgi[${inv[$swapB]}]} ]]; then
							echo "Not enough agility"
							space_
							return 0
						fi
					fi
					old1=${inv[$swapA]}
					oldowned1=${owned[$swapA]}
					old2=${inv[$swapB]}
					oldowned2=${owned[$swapB]}
					inv[$swapA]=$old2
					owned[$swapA]=$oldowned2
					inv[$swapB]=$old1
					owned[$swapB]=$oldowned1
					echo "Swap Succesful"
					space_
				else
					echo "Invalid Swap"
					space_
				fi
			else
				echo "Invalid Swap"
				space_
			fi
		elif [[ $invMode = 1 ]]; then
			read -p "Item to drop: " swapA
			if [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]] || [[ $swapA = 0 ]]; then
				echo "Dropped ${inv[$swapA]}"
				inv[$swapA]=0
			else
				echo "Invalid drop"
				space_
			fi
		elif [[ $invMode = 2 ]]; then
			read -p "Item to use: " swapA
			if [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]] || [[ $swapA = 0 ]]; then
				if [[ ${inv[$swapA]} = 10 ]]; then
					if [[ $level != moon ]]; then
						echo "a moon vortex has opened!!!"
						audio_ moon
						level=moon
						x=5
						y=3
						posCorrect_
					else
						echo "a moon vortex has opened!!!"
						level=overworld
						audio_ overworld
						x=5
						y=3
						posCorrect_
						space_
					fi
				elif [[ ${inv[$swapA]} = 7 ]]; then
					echo "It tastes a little funny..."
					inv[$swapA]="0"
					effect_ a 0
					space_
				elif [[ ${inv[$swapA]} = 8 ]]; then
					echo "You feel a draining sensation..."
					inv[$swapA]="0"
					hp=1
					levelUp_
					space_
				elif [[ ${inv[$swapA]} = 9 ]]; then
					echo "You feel a lot smarter!"
					space_
				elif [[ ${inv[$swapA]} = 11 ]]; then
					echo -e "You try chewing on the regen \namulet but nothing happens.\n  A passing faerie sees you.  \nYou feel embarrassed."
					space_
				elif [[ ${inv[$swapA]} = 13 ]]; then
					echo "The magnet shivers, then explodes into gold"
					inv[$swapA]="0"
					gold=$(($gold*2))
					space_
				elif [[ ${inv[$swapA]} = 15 ]]; then
					echo "You open the dusty pages..."
					space_
					book_
				elif [[ ${inv[$swapA]} = 16 ]]; then
					echo "The cheese tastes a bit dusty and old..."
					inv[$swapA]="0"
					hp=$mp
					space_
				elif [[ ${inv[$swapA]} = 17 ]]; then
					echo "You found the antidote!"
					for ((e=0;e<${#effectd[@]};e++)); do
						effectd[$e]=1
					done
					inv[$swapA]="0"
					space_
				elif [[ ${inv[$swapA]} = 18 ]]; then
					magicPoints=$mmagicPoints
					echo "It tastes a bit funny..."
					inv[$swapA]="0"
					space_
				elif [[ ${inv[$swapA]} = 19 ]]; then
					echo "It doesn't seem to stop spinning..."
					space_
				elif [[ ${inv[$swapA]} = 20 ]] || [[ ${inv[$swapA]} = 21 ]] || [[ ${inv[$swapA]} = 22 ]]; then
					if [[ ${effects[2]} = 0 ]]; then
						echo "You drink the ${invl[${inv[$swapA]}]}"
						effect_ a 2
						drinksHad=$((${inv[$swapA]}-19))
					else
						echo "You drink another"
						effectd[2]=$((RANDOM%25+10))
						drinksHad=$((drinksHad+$((${inv[$swapA]}-19))))
					fi
					inv[$swapA]="0"
					space_
				elif [[ ${inv[$swapA]} = 23 ]]; then
					audio_ town
					level=town
					x=12
					y=14
					anim_ e
					posCorrect_ noblock
					inv[$swapA]=0
				else
					echo "Nothing."
					space_
				fi
			else
				echo "Nothing."
				space_
			fi
		elif [[ $invMode = 3 ]]; then
			berry_ inv
		fi
	elif [[ $1 = add ]]; then
		echo "0) ${invl[${inv[0]}]}  <- Equipped Weapon"
		echo "1) ${invl[${inv[1]}]}  <- Equipped Armour"
		echo "2) ${invl[${inv[2]}]}"
		echo "3) ${invl[${inv[3]}]}"
		while true; do
			read -p "Item to replace, c to cancel: " swapA
			audio_ click
			sleep 0.25
			if [[ $swapA = 0 ]] || [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]]; then
				if [[ $swapA = 0 ]]; then
					if [[ $agility -lt ${minAgi[$2]} ]]; then
						echo "Not enough agility"
						purchased=false
						space_
						break
					fi
				fi
				owned[$swapA]=$saveSlot
				inv[$swapA]=$2
				echo "Got ${invl[$2]}"
				purchased=true
				audio_ chest
				space_
				break
			elif [[ $swapA = c ]]; then
				break
			else
				echo "Please select a slot"
			fi
		done
	fi
}