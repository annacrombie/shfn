function barShop_ {
	while true; do
		clear
		echo -e "+----------------------------+\n|                            |\n|                            |\n|      D               @     |\n|     -|-             -|-    |\n|----------------------------+"
		echo "| Bartender: Whats your      |"
		echo "| poision?                   |"
		echo "|----------------------------|"
		echo "| 0) ${invl[20]}...${prices[20]}"
		echo "| 1) ${invl[21]}...${prices[21]}"
		echo "| 2) ${invl[22]}...${prices[22]}"
		echo "|----------------------------+"
		echo "| "
		echo "| "
		echo "+----------------------------+"
		read -p "Item to buy, q to cancel: " key
		if [[ $key = q ]]; then
			break
		elif [[ $key = 0 ]]; then
			if [[ $gold -ge ${prices[20]} ]]; then
				echo "Bought ${invl[20]}"
				inventory_ add 20
				gold=$(($gold-${prices[20]}))
			else
				echo "Im tryin to run a buisiness, I cant give free drinks!"
				space_
			fi
			break
		elif [[ $key = 1 ]]; then
			if [[ $gold -ge ${prices[21]} ]]; then
				echo "Bought ${invl[21]}"
				inventory_ add 21
				gold=$(($gold-${prices[21]}))
			else
				echo "Im tryin to run a buisiness, I cant give free drinks!"
				space_
			fi
			break
		elif [[ $key = 2 ]]; then
			if [[ $gold -ge ${prices[22]} ]]; then
				echo "Bought ${invl[22]}"
				inventory_ add 22
				gold=$(($gold-${prices[22]}))
			else
				echo "Im tryin to run a buisiness, I cant give free drinks!"
				space_
			fi
			break
		fi
	done
}