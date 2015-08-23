function characterSheet_ {
	if [[ $1 = small ]]; then       
		echo "Lvl: $(printf "%02d" $lvl)  | Hp: $(printf "%04d" $hp)/$(printf "%04d" $mp)"
		echo "Pot: $(printf "%02d" $potions)  | Gold: $(printf "%07d" $gold) Effect: $(effect_ d)"
		echo "F to save P to use potion I for inventory"
		echo "U for character sheet"
	else
		while true; do
			sel1=" "; sel2=" "; sel3=" "; sel4=" "
			vara=sel$sbase; varb=sel$(($sbase+1))
			eval $vara=\"[\"; eval $varb=\"]\"
			clear
			echo "#"
			echo "# Level: $lvl $name, ${classes[$class]}"
			echo "# Icon: $avatar"
			echo "# -----"
			echo "# Health: $hp/$mp"
			if [[ $class = 1 ]] || [[ $class = 2 ]]; then
				echo "# Magic: $magicPoints/$mmagicPoints"
			fi
			echo "# Defense: $defense"
			echo "# Agility: $agility"
			echo "# Strength: $power"
			echo "# Intelect: $intelect"
			echo "# Experience: $xp/$(($lvl*110))"
			echo "# Potions: $potions"
			echo "# Gold: $gold"
			echo "# Effect(s): $(effect_ d)"
			echo "# -----"
			echo "# $sel1 Edit $sel2 $sel3 Done $sel4"
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
					read -p "New name: " name
					read -n 1 -p "New icon: " avatar
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
	fi
}