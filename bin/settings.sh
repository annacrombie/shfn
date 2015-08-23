function settings_ {
	echo ""
	while true; do
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo -en "\rAudio: $sel1 on $sel2 $sel3 off $sel4"
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
				music=on
			elif [[ $sbase = 3 ]]; then
				music=off
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
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo -en "\rAnimation Speed: $sel1 slow $sel2 $sel3 fast $sel4"
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
				aSpeed=slow
			elif [[ $sbase = 3 ]]; then
				aSpeed=fast
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
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo -en "\rReset Saves: $sel1 yes $sel2 $sel3 no $sel4"
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
				rm -rf ./save/*
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
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo -en "\rReset Stats: $sel1 yes $sel2 $sel3 no $sel4"
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
				stats_ reset
				stats_ save
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
		sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
		vara=sel$sbase; varb=sel$(($sbase+1))
		eval $vara=\"[\"; eval $varb=\"]\"
		echo -en "\rSave Settings: $sel1 yes $sel2 $sel3 no $sel4"
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
				save_ settings
			fi
			break
		fi
		if [[ $sbase -lt 1 ]]; then
			sbase=1
		elif [[ $sbase -gt 5 ]]; then
			sbase=5
		fi
	done
}