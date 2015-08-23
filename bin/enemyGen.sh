function enemyGen_ {
	if [[ $1 = boss ]]; then
		if [[ $boss = 0 ]]; then
			echo "ShadowKnight $((RANDOM%100+150)) $((RANDOM%100+150)) $((RANDOM%100+150)) $((RANDOM%100+150)) S 50"
		elif [[ $boss = 1 ]]; then
			echo "Death 900 900 900 900 D 100"
		fi
	elif [[ $1 = moon ]]; then
		echo "ManInMoon 100 130 500 200 ◊ 25"
	elif [[ $1 = witch ]]; then
		echo "Witches 50 250 250 100 WW 15"
	elif [[ $1 = guard ]]; then
		echo "Guard 50 50 50 50 G 15"
	else
		if [[ $level = overworld ]] || [[ $level = random ]]; then
			enemy=('Troll' 'Ogre' 'Wolf' 'Goblin' 'Bear')
			enemyIco=("T" "O" "W" "G" "B")
			enemyHealth=("25" "30" "20" "25" "35")
			enemyPower=("20" "25" "10" "30" "30")
			enemyDefense=("50" "50" "20" "30" "45")
			enemyAgility=("10" "10" "70" "30" "30")
			enemyPoison=("0" "0" "0" "1" "0")
		elif [[ $level = castle ]] || [[ $level = fort ]]; then
			enemy=('Bone' 'Ghoul' 'Spider' 'Creep' 'Zombie')
			enemyIco=("T" "O" "W" "G" "B")
			enemyHealth=("25" "30" "20" "25" "35")
			enemyPower=("40" "50" "40" "50" "55")
			enemyDefense=("50" "50" "20" "30" "45")
			enemyAgility=("10" "10" "70" "30" "30")
			enemyPoison=("0" "0" "1" "0" "1")
		elif [[ $level = moon ]]; then
			enemy=('MoonTrol' 'MoonOgre' 'MoonWolf' 'MoonGoblin' 'MoonBear')
			enemyIco=("Å" "Î" "∏" "Ó" "‡")
			enemyHealth=("10" "10" "10" "10" "10")
			enemyPower=("70" "70" "70" "70" "70")
			enemyDefense=("10" "10" "10" "10" "10")
			enemyAgility=("10" "10" "10" "10" "10")
			enemyPoison=("0" "0" "0" "0" "0")
		elif [[ $level = crater ]]; then
			enemy=('CraterSnob')
			enemyIco=('w')
			enemyHealth=('20')
			enemyPower=('35')
			enemyDefense=('40')
			enemyAgility=('20')
			enemyPoison=('1')
		elif [[ $level = tavern ]]; then
			enemy=('Drunk')
			enemyIco=('P')
			enemyHealth=('30')
			enemyPower=('15')
			enemyDefense=('1')
			enemyAgility=('1')
			enemyPoison=('0')
		fi
		local rE=$((RANDOM%${#enemy[@]}))
		local rEL=$((RANDOM%$lvl+1))
		if [[ $rEL -lt $(($lvl-3)) ]]; then
			local rEL=$(($lvl-3))
		fi
		echo "${enemy[$rE]} $((${enemyPower[$rE]}+($rEL*10))) $((${enemyDefense[$rE]}+($rEL*15))) $((${enemyAgility[$rE]}+($rEL*15))) $((${enemyHealth[$rE]}+($rEL*15))) ${enemyIco[$rE]} $rEL ${enemyPoison[$rE]}"
	fi
}