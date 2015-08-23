function title_ {
	audio_ title
	logo_
	sbase=1
	while true; do
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "; sel7=" "; sel8=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo -en "\r$sel1 New $sel2 $sel3 Resume $sel4 $sel5 Stats/Settings $sel6 $sel7 Exit $sel8"
		read -s -n 1 key
		audio_ click
		if [[ -n $key ]]; then
			if [[ $key = d ]]; then
				((sbase=$sbase+2))
			elif [[ $key = a ]]; then
				((sbase=$sbase-2))
			elif [[ $key = b ]]; then
				if [[ -f ./allowBeta ]]; then
					echo "allowBeta off"
				else
					echo "allowBeta on"
					touch ./allowBeta
				fi
			fi
		else
			if [[ $sbase = 1 ]]; then
				echo ""
				while true; do
					sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo -en "\r$sel1 Slot 0 <$(slot_ 0 name)> $sel2 $sel3 Slot 1 <$(slot_ 1 name)> $sel4 $sel5 Slot 2 <$(slot_ 2 name)> $sel6"
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
							saveSlot=0
						elif [[ $sbase = 3 ]]; then
							saveSlot=1
						elif [[ $sbase = 5 ]]; then
							saveSlot=2
						fi
						break
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 5 ]]; then
						sbase=5
					fi
				done
				if [[ -f ./save/sav$saveSlot ]]; then
					rm ./save/sav$saveSlot
				fi
				if [[ -f ./save/terrain$saveSlot ]]; then
					rm ./save/terrain$saveSlot
				fi
				echo ""
				while true; do
					sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo -en "\r$sel1 Easy $sel2 $sel3 Medium $sel4 $sel5 Hard $sel6"
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
							difficulty=0
						elif [[ $sbase = 3 ]]; then
							difficulty=1
						elif [[ $sbase = 5 ]]; then
							difficulty=2
						fi
						break
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 5 ]]; then
						sbase=5
					fi
				done
				echo ""
				while true; do
					sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "; sel7=" "; sel8=" ";
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo -en "\r$sel1 ${classes[0]} $sel2 $sel3 ${classes[1]} $sel4 $sel5 ${classes[2]} $sel6 $sel7 ${classes[3]} $sel8"
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
							class=0
						elif [[ $sbase = 3 ]]; then
							class=1
						elif [[ $sbase = 5 ]]; then
							class=2
						elif [[ $sbase = 7 ]]; then
							class=3
						fi
						ini_ class first
						break
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 7 ]]; then
						sbase=7
					fi
				done
				echo ""
				read -p "Name: " name
				audio_ click
				save_
				anim_ openingCutscene
				x=5; y=3
				break
			elif [[ $sbase = 3 ]]; then
				echo ""
				while true; do
					sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo -en "\r$sel1 Slot 0 <$(slot_ 0 name)> $sel2 $sel3 Slot 1 <$(slot_ 1 name)> $sel4 $sel5 Slot 2 <$(slot_ 2 name)> $sel6"
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
							saveSlot=0
						elif [[ $sbase = 3 ]]; then
							saveSlot=1
						elif [[ $sbase = 5 ]]; then
							saveSlot=2
						fi
						break
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 5 ]]; then
						sbase=5
					fi
				done
				if [[ -f ./save/sav$saveSlot ]]; then
					load_
					break
				fi
			elif [[ $sbase = 5 ]]; then
				echo ""
				while true; do
					sel1=" "; sel2=" "; sel3=" "; sel4=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo -en "\r$sel1 Settings $sel2 $sel3 Stats $sel4"
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
							settings_
							save_ settings
							load_ settings
							clear
							logo_
						elif [[ $sbase = 3 ]]; then
							stats_ display
							clear
							logo_
						fi
						break
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 3 ]]; then
						sbase=3
					fi
				done
			elif [[ $sbase = 7 ]]; then
				audio_ stop
				exit
			fi
		fi
		if [[ $sbase -lt 1 ]]; then
			sbase=1
		elif [[ $sbase -gt 7 ]]; then
			sbase=7
		fi
	done
}