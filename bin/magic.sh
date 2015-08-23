function magic_ {
	if [[ $1 = use ]]; then
		for ((i=0;i<${#spelln[@]};i++)); do
			if [[ $intelect -ge ${spellintelect[$i]} ]]; then
				echo "$i) ${spelln[$i]} Cost: ${spellc[$i]}"
			fi
		done
		echo "Magic: $magicPoints/$mmagicPoints"
		echo "Enter number of Spell to cast"
		read -p "or c to cancel: " s2c
		if [[ $s2c = c ]]; then
			return 1
		else
			if [[ $magicPoints -ge ${spellc[$s2c]} ]] && [[ $intelect -ge ${spellintelect[$s2c]} ]]; then
				spellDamage=$((${spellp[$s2c]}+$((RANDOM%$intelect+1))))
				((magicPoints=$magicPoints-${spellc[$s2c]}))
			else
				spellDamage=0
				echo "Nothing."
			fi
			return 0
		fi
	fi
}