function stats_ {
	if [[ $1 = reset ]]; then
		SECONDS=0
		stat_fights=0
		stat_wins=0
		stat_losses=0
		stat_runs=0
		stat_potions=0
		stat_gold=0
	elif [[ $1 = save ]]; then
		echo "time $SECONDS" > ./stats
		echo "fights $stat_fights" >> ./stats
		echo "wins $stat_wins" >> ./stats
		echo "losses $stat_losses" >> ./stats
		echo "runs $stat_runs" >> ./stats
		echo "potions $stat_potions" >> ./stats
		echo "gold $stat_gold" >> ./stats
	elif [[ $1 = load ]]; then
		stat_fights=$(cat ./stats | grep fights | awk '{print $2}')
		stat_wins=$(cat ./stats | grep wins | awk '{print $2}')
		stat_losses=$(cat ./stats | grep losses | awk '{print $2}')
		stat_runs=$(cat ./stats | grep runs | awk '{print $2}')
		stat_potions=$(cat ./stats | grep potions | awk '{print $2}')
		stat_gold=$(cat ./stats | grep gold | awk '{print $2}')
	elif [[ $1 = display ]]; then
		stats_ load
		clear
		echo "Stats: "
		echo "Time Played: $(timeResolve_ $(cat ./stats | grep time | awk '{print $2}'))"
		echo "Fights: $stat_fights"
		echo "Fights Won: $stat_wins"
		echo "Deaths: $stat_losses"
		echo "Blocks Moved: $stat_runs"
		echo "Potions Used: $stat_potions"
		echo "Gold Accumulated: $stat_gold"
		space_
	fi
}