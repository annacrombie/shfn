function event_ {
	if [[ $1 = r ]]; then
		if [[ $level = overworld ]]; then
			if [[ $((RANDOM%2)) = 0 ]]; then
				if [[ ${events[1]} = 0 ]]; then
					events[1]=1
					conversation_ man
				fi
			else
				conversation_ dwarf
				events[2]=1
			fi
		elif [[ $level = castle ]]; then
			if [[ ${events[3]} = 0 ]]; then
				events[3]=1
				conversation_ prisoner
			fi
		fi
	fi
}