function berry_ {
	if [[ ${berryEffect[0]} = x ]]; then
		for ((i=0;i<${#berryEffect[@]};i++)); do
			berryEffect[$i]=$((RANDOM%3))
		done
	fi
	if [[ $1 = inv ]]; then
		echo "0) ${berryName[${berryInventory[0]}]} Berry"
		echo "1) ${berryName[${berryInventory[1]}]} Berry"
		echo "2) ${berryName[${berryInventory[2]}]} Berry"
		echo "3) ${berryName[${berryInventory[3]}]} Berry"
		while true; do
			sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "; sel7=" "; sel8=" "
			vara=sel$sbase; varb=sel$(($sbase+1))
			eval $vara=\"[\"; eval $varb=\"]\"
			echo -en "\r$sel1 Swap $sel2 $sel3 Drop $sel4 $sel5 Eat $sel6 $sel7 Cancel $sel8"
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
			elif [[ $sbase -gt 7 ]]; then
				sbase=7
			fi
		done
		echo ""
		if [[ $invMode = 0 ]]; then
			read -p "Berry to swap: " swapA
			read -p "Berry to swap with: " swapB
			if [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]] || [[ $swapA = 0 ]]; then
				if [[ $swapB = 1 ]] || [[ $swapB = 2 ]] || [[ $swapB = 3 ]] || [[ $swapB = 0 ]]; then
					old1=${berryInventory[$swapA]}
					old2=${berryInventory[$swapB]}
					berryInventory[$swapA]=$old2
					berryInventory[$swapB]=$old1
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
				echo "Dropped ${berryInventory[$swapA]}"
				berryInventory[$swapA]=0
			else
				echo "Invalid drop"
				space_
			fi
		elif [[ $invMode = 2 ]]; then
			read -p "Item to use: " swapA
			if [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]] || [[ $swapA = 0 ]]; then
				if [[ ${berryEffect[${berryInventory[$swapA]}]} = 0 ]]; then
					echo "The berry tastes good and fills you with vitality!"
					hp=$(($hp+50))
					if [[ $hp -gt $mp ]]; then
						hp=$mp
					fi
					berryInventory[$swapA]=0
					space_
				elif [[ ${berryEffect[${berryInventory[$swapA]}]} = 1 ]]; then
					echo "The berry tastes bitter and makes you sick!"
					hp=$(($hp-50))
					if [[ $hp -lt 1 ]]; then
						death_
					fi
					berryInventory[$swapA]=0
					space_
				elif [[ ${berryEffect[${berryInventory[$swapA]}]} = 2 ]]; then
					echo "The berry tastes really really good and fills you up with vitality!"
					hp=$(($hp+100))
					if [[ $hp -gt $mp ]]; then
						hp=$mp
					fi
					berryInventory[$swapA]=0
					space_
				elif [[ ${berryEffect[${berryInventory[$swapA]}]} = 1 ]]; then
					echo "The berry tastes extremely bitter and makes you very sick!"
					hp=$(($hp-100))
					if [[ $hp -lt 1 ]]; then
						death_
					fi
					berryInventory[$swapA]=0
					space_
				fi
			fi
		fi
	elif [[ $1 = found ]]; then
		berryFound=$((RANDOM%${#berryEffect[@]}+1))
		echo "Found a ${berryName[$berryFound]} Berry!"
		echo "0) ${berryName[${berryInventory[0]}]} Berry"
		echo "1) ${berryName[${berryInventory[1]}]} Berry"
		echo "2) ${berryName[${berryInventory[2]}]} Berry"
		echo "3) ${berryName[${berryInventory[3]}]} Berry"
		while true; do
			read -p "Item to replace, c to cancel: " swapA
			audio_ click
			sleep 0.25
			if [[ $swapA = 0 ]] || [[ $swapA = 1 ]] || [[ $swapA = 2 ]] || [[ $swapA = 3 ]]; then
				berryInventory[$swapA]=$berryFound
				audio_ chest
				space_
				clear
				map_
				break
			elif [[ $swapA = c ]]; then
				break
			else
				echo "Please select a slot"
			fi
		done
	fi
}