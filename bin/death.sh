function death_ {
	clear
	if [[ $(echo ${inv[@]} | grep 19) ]]; then
		echo ""
		echo ""
		echo "  +-------------------+"
		echo "  |   You wake up!    |"
		echo "  +-------------------+"
		echo ""
		inv=($(echo ${inv[@]} | sed 's/19/0/g'))
	else
		echo ""
		echo ""
		echo "  +-------------------+"
		echo "  |   You are dead    |"
		echo "  +-------------------+"
		echo ""
		((lives--))
		((stat_losses++))
	fi
	space_
	if [[ $lives -lt 1 ]]; then
		echo "+-----------+"
		echo "| Game Over |"
		echo "+-----------+"
		space_
		cat ./save/sav$saveSlot > ./save/b
		rm ./save/sav$saveSlot
		launch_
	else
		ini_ reset
		posCorrect_
		break
	fi
}