function bank_ {
	if [[ -f ./save/bank ]]; then
		load_ bank
	fi
	while true; do
		clear
		sel1=" "; sel2=" "; sel3=" "; sel4=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo "+----------------------------+"
		echo "|       |  I'll Keep your    |"
		echo "|       |  things safe!      |"
		echo "|    0  | $avatar                  |"
		echo "|   -|- |-|-                 |"
		echo "|       |--------------------|"
		echo "|       | 0) ${invl[${bank[0]}]}"
		echo "|       | 1) ${invl[${bank[1]}]}"
		echo "|       | 2) ${invl[${bank[2]}]}"
		echo "|       | 3) ${invl[${bank[3]}]}"
		echo "|----------------------------+"
		echo "|                            |"
		echo "|$sel1 Trade $sel2 $sel3 Leave $sel4         |"
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
				echo "0) ${invl[${inv[0]}]}  <- Equipped Weapon"
				echo "1) ${invl[${inv[1]}]}  <- Equipped Armour"
				echo "2) ${invl[${inv[2]}]}"
				echo "3) ${invl[${inv[3]}]}"
				while true; do
					sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo -en "\r$sel1 Deposit (50 Gold) $sel2 $sel3 Withdraw $sel4 $sel5 Cancel $sel6"
					read -s -n 1 key
					if [[ -n $key ]]; then
						if [[ $key = d ]]; then
							((sbase=$sbase+2))
						elif [[ $key = a ]]; then
							((sbase=$sbase-2))
						fi
					else
						echo ""
						if [[ $sbase = 1 ]]; then
							if [[ $gold -ge 50 ]]; then
								((gold=$gold-50))
								read -p "Item to deposit: " i2w
								read -p "Slot to place item: " s2p
								if [[ $i2w -ge 0 ]] && [[ $i2w -le 3 ]] && [[ $s2p -ge 0 ]] && [[ $s2p -le 3 ]]; then
									bank[$s2p]=${inv[$i2w]}
									bOwned[$s2p]=${owned[$i2w]}
									inv[$i2w]=0
								fi
								break
							else
								echo "You can't pay!"
								space_
								break
							fi
						elif [[ $sbase = 3 ]]; then
							read -p "Item to withdraw: " i2w
							read -p "Slot to place item: " s2p
							if [[ $i2w -ge 0 ]] && [[ $i2w -le 3 ]] && [[ $s2p -ge 0 ]] && [[ $s2p -le 3 ]]; then
								inv[$s2p]=${bank[$i2w]}
								owned[$s2p]=${bOwned[$i2w]}
								bank[$i2w]=0
							fi
							break
						else
							break
						fi
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 6 ]]; then
						sbase=6
					fi
				done
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
	save_ bank
}