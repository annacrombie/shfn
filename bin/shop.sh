function shop_ {
	while true; do
		clear
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "; sel7=" "; sel8=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo "##############################"
		echo "#      0     |   @           #"
		echo "#     -|-    |  -|-          #"
		echo "#----------------------------#"
		echo "# 1) ${invl[1]} ${prices[1]} Gold"
		echo "# 2) ${invl[2]} ${prices[2]} Gold"
		echo "# 3) ${invl[3]} ${prices[3]} Gold"
		echo "# 4) ${invl[4]} ${prices[4]} Gold" 
		echo "# 5) ${invl[5]} ${prices[5]} Gold"
		echo "# 6) ${invl[6]} ${prices[6]} Gold"
		echo "# P) Potion 70 Gold"
		echo "# A) Antidote ${prices[17]} Gold"
		echo "# M) Mana Potion ${prices[18]} Gold"
		echo "# S) Town Scroll ${prices[23]} Gold"
		echo "##############################"
		echo -en "# $sel1 Buy $sel2 $sel3 Sell $sel4 $sel5 Exit $sel6"
		if [[ $class = 3 ]]; then
			echo -en " $sel7 Steal $sel8\n"
		else
			echo -en "\n"
		fi
		echo "# Gold: $gold"
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
				while true; do
					echo "Enter the number of the item"
					read -p "you want, or q to exit: " key
					audio_ click
					if [[ $key -ge 1 ]] && [[ $key -le 6 ]]; then
						if [[ $gold -ge ${prices[$key]} ]]; then
							inventory_ add $key
							if [[ $purchased = true ]]; then
								gold=$(($gold-${prices[$key]}))
							fi
							break
						else
							echo "Not enough Money."
							space_
							break
						fi
					else
						if [[ $key = P ]] || [[ $key = p ]]; then
							read -p "Enter the quantity of potions: " key
							audio_ click
							if [[ $gold -ge $((70*$key)) ]]; then
								potions=$(($potions+$key))
								gold=$(($gold-($key*70)))
								echo "Got $key potions"
								space_
								break
							else
								echo "Not enough Money."
								space_
								break
							fi
						elif [[ $key = a ]] || [[ $key = A ]]; then
							audio_ click
							if [[ $gold -ge ${prices[17]} ]]; then
								inventory_ add 17
								gold=$(($gold-${prices[17]}))
								space_
								break
							else
								echo "Not enough Money."
								space_
								break
							fi
						elif [[ $key = m ]] || [[ $key = M ]]; then
							audio_ click
							if [[ $gold -ge ${prices[18]} ]]; then
								inventory_ add 18
								gold=$(($gold-${prices[18]}))
								space_
								break
							else
								echo "Not enough Money."
								space_
								break
							fi
						elif [[ $key = s ]] || [[ $key = S ]]; then
							audio_ click
							if [[ $gold -ge ${prices[23]} ]]; then
								inventory_ add 23
								gold=$(($gold-${prices[23]}))
								space_
								break
							else
								echo "Not enough Money."
								space_
								break
							fi
						fi
					fi
				done
			elif [[ $sbase = 3 ]]; then
				echo "0) ${invl[${inv[0]}]}  Sell price: $((${prices[${inv[0]}]}/2)) gold"
				echo "1) ${invl[${inv[1]}]}  Sell price: $((${prices[${inv[1]}]}/2)) gold"
				echo "2) ${invl[${inv[2]}]}  Sell price: $((${prices[${inv[2]}]}/2)) gold"
				echo "3) ${invl[${inv[3]}]}  Sell price: $((${prices[${inv[3]}]}/2)) gold"
				echo "Enter the number of the item"
				read -p "you want to sell, or q to exit: " key
				audio_ click
				if [[ $key = q ]]; then
					break
				else
					if [[ ${owned[$key]} = $saveSlot ]]; then
						echo "Sold ${invl[${inv[$key]}]}"
						gold=$(($gold+(${prices[${inv[$key]}]}/2)))
						inv[$key]=0
						space_
					else
						echo "You don't own this item!"
						space_
					fi
				fi
			elif [[ $sbase = 5 ]]; then
				break
			elif [[ $sbase = 7 ]]; then
				echo "Enter the number of the item"
				read -p "you want, or q to exit: " key
				audio_ click
				if [[ $key -ge 1 ]] && [[ $key -le 6 ]]; then
					if [[ $((RANDOM%10)) -gt 3 ]]; then
						inventory_ add $key
						break
					else
						echo "Uh Oh! You got caught!."
						inv=("0" "0" "0" "0")
						space_
						level=prison
						x=18
						y=9
						posCorrect_
						break
					fi
				else
					if [[ $key = P ]]; then
						read -p "Enter the quantity of potions: " key
						audio_ click
						if [[ $gold -ge $((70*$key)) ]]; then
							potions=$(($potions+$key))
							gold=$(($gold-($key*70)))
							echo "Got $key potions"
							space_
							break
						else
							echo "Not enough Money."
							space_
							break
						fi
					fi
				fi
			fi
			break
		fi
		if [[ $sbase -lt 1 ]]; then
			sbase=1
		elif [[ $sbase -ge 7 ]]; then
			if [[ $class = 3 ]]; then
				sbase=7
			else
				sbase=5
			fi
		fi
	done
}