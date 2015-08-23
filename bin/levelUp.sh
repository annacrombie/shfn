function levelUp_ {
	if [[ $1 = cheat ]]; then
		echo "Level Up!"
		((lvl=$lvl+$2))
		mp=$((120+($mpMod*$lvl)))
		power=$((35+($powerMod*$lvl)))
		intelect=$((20+($intelectMod*$lvl)))
		defense=$((40+($defenseMod*$lvl)))
		agility=$((20+($agilityMod*$lvl)))
		mmagicPoints=$((2+($magicMod*$lvl)))
		space_
	else
		echo "Level Up!"
		xp=$(($xp-$(($lvl*110)) ))
		((lvl++))
		mp=$(($mpFirst+($mpMod*$lvl)))
		power=$(($powerFirst+($powerMod*$lvl)))
		intelect=$(($intelectFirst+($intelectMod*$lvl)))
		defense=$(($defenseFirst+($defenseMod*$lvl)))
		agility=$(($agilityFirst+($agilityMod*$lvl)))
		mmagicPoints=$(($mmagicPointsFirst+($magicMod*$lvl)))
		for ((i=0;i<${#spellUnlock[@]};i++)); do
			if [[ ${spellUnlock[$i]} = 0 ]]; then
				if [[ $intelect -ge ${spellintelect[$i]} ]]; then
					echo "You learned ${spelln[$i]}"
					spellUnlock[$i]=1
				fi
			fi
		done
		space_
	fi
}