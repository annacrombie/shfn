function cheat_ {
	if [[ $1 = tp ]]; then
		x=$2; y=$3
	elif [[ $1 = heal ]]; then
		hp=$mp
	elif [[ $1 = lup ]]; then
		levelUp_ cheat $2
	elif [[ $1 = e ]]; then
		if [[ $encounterEnemies = true ]]; then
			encounterEnemies=false
			echo "No more enemies!"
			space_
		elif [[ $encounterEnemies = false ]]; then
			encounterEnemies=true
			echo "Watch out!"
			space_
		fi
	elif [[ $1 = give ]]; then
		inventory_ add $2
	elif [[ $1 = effect ]]; then
		effect_ a $2
	elif [[ $1 = wtp ]]; then
		level=$2
		posCorrect_ noblock
	elif [[ $1 = rt ]]; then
		randomTerrain_
		level="random"
		x=$randomSpawnX
		y=$randomSpawnY
	elif [[ $1 = c ]]; then
		console_
	fi
}