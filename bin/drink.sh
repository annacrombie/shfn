function drink_ {
	((stat_potions++))
	if [[ $potions -gt 0 ]]; then
		hp=$(($hp+50))
		if [[ $hp -gt $mp ]]; then
			hp=$mp
		fi
		((potions--))
		echo "HP Up"
		audio_ chest
		potionused=true
		sleep 0.5
	else
		echo "Nothing."
		sleep 0.5
	fi
}