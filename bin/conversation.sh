function conversation_ {
	if [[ $1 = man ]]; then
		while true; do
			clear
			sel1=" "; sel2=" "; sel3=" "; sel4=" "
			vara=sel$sbase; varb=sel$(($sbase+1))
			eval $vara=\"[\"; eval $varb=\"]\"
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      M               @     |"
			echo "|     -|-             -|-    |"
			echo "|----------------------------+"
			echo "| Man: Greetings traveler,   |"
			echo "| it has been many moons     |"
			echo "| since I have seen someone  |"
			echo "| pass through these parts.  |"
			echo "| What is your buisiness     |"
			echo "| here?                      |"
			echo "|----------------------------+"
			echo "| $sel1 Destruction of evil is my quest. $sel2"
			echo "| $sel3 Why do you want to know? $sel4"
			echo "+----------------------------+"
			read -s -n 1 key
			audio_ click
			if [[ -n $key ]]; then
				if [[ $key = d ]] || [[ $key = s ]]; then
					((sbase=$sbase+2))
				elif [[ $key = a ]] || [[ $key = w ]]; then
					((sbase=$sbase-2))
				fi
			else
				if [[ $sbase = 1 ]]; then
					response=0
					break
				elif [[ $sbase = 3 ]]; then
					response=1
					break
				fi
			fi
			if [[ $sbase -lt 1 ]]; then
				sbase=1
			elif [[ $sbase -gt 3 ]]; then
				sbase=3
			fi
		done
		if [[ $response = 0 ]]; then
			while true; do
				clear
				sel1=" "; sel2=" "; sel3=" "; sel4=" "; sel5=" "; sel6=" "
				vara=sel$sbase; varb=sel$(($sbase+1))
				eval $vara=\"[\"; eval $varb=\"]\"
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      M               @     |"
				echo "|     -|-             -|-    |"
				echo "|----------------------------+"
				echo "| Man: Ah yes, destruction   |"
				echo "| of evil.  A truly noble    |"
				echo "| task.  If there is anything|"
				echo "| I could be of assistance   |"
				echo "| with, please ask!          |"
				echo "|----------------------------+"
				echo "| $sel1 Do you have any provisions? $sel2"
				echo "| $sel3 Where can I find this evil? $sel4"
				echo "| $sel5 I'll be on my way then $sel6"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						if [[ -z $oldpotions ]]; then
							clear
							local oldpotions=$((RANDOM%3+2))
							potions=$(($potions+$oldpotions))
							echo "+----------------------------+"
							echo "|                            |"
							echo "|                            |"
							echo "|      M               @     |"
							echo "|     -|-             -|-    |"
							echo "|----------------------------+"
							echo "| Man: Why didn't you say so?|"
							echo "| I always keep a few potions|"
							echo "| handy.  Here, take these $oldpotions |"
							echo "| potions.                   |"
							echo "|                            |"
							echo "|                            |"
							echo "|----------------------------+"
							echo "| Potions=$potions"
							echo "|                            |"
							echo "+----------------------------+"
							audio_ chest
							space_
						else
							clear
							echo "+----------------------------+"
							echo "|                            |"
							echo "|                            |"
							echo "|      M               @     |"
							echo "|     -|-             -|-    |"
							echo "|----------------------------+"
							echo "| Man: I've given you all I  |"
							echo "| have.                      |"
							echo "|                            |"
							echo "|                            |"
							echo "|                            |"
							echo "|                            |"
							echo "|----------------------------+"
							echo "| Potions=$potions"
							echo "|                            |"
							echo "+----------------------------+"
							space_
						fi
					elif [[ $sbase = 3 ]]; then
						clear
						echo "+----------------------------+"
						echo "|                            |"
						echo "|                            |"
						echo "|      M               @     |"
						echo "|     -|-             -|-    |"
						echo "|----------------------------+"
						echo "| Man: I've heard tell of a  |"
						echo "| castle to the south.  Deep |"
						echo "| in it's inner chambers lies|"
						echo "| the shadow knight, a fierce|"
						echo "| foe.                       |"
						echo "|                            |"
						echo "|----------------------------+"
						echo "| Potions=$potions"
						echo "|                            |"
						echo "+----------------------------+"
						space_
						clear
						echo "+----------------------------+"
						echo "|                            |"
						echo "|                            |"
						echo "|      M               @     |"
						echo "|     -|-             -|-    |"
						echo "|----------------------------+"
						echo "| Man: If you defeat him, the|"
						echo "| waters will lower,         |"
						echo "| revealing a land bridge to |"
						echo "| crescent island.           |"
						echo "| That is all I know.        |"
						echo "|                            |"
						echo "|----------------------------+"
						echo "| Potions=$potions"
						echo "|                            |"
						echo "+----------------------------+"
						space_
					elif [[ $sbase = 5 ]]; then
						break
					fi
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 5 ]]; then
					sbase=5
				fi
			done
			clear
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      M               @     |"
			echo "|     -|-             -|-    |"
			echo "|----------------------------+"
			echo "| Man: Oh, and watch out for |"
			echo "| the empty house.  It lies  |"
			echo "| hidden along the coast.    |"
			echo "| Also, take my book. It will|"
			echo "| help.                      |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| Potions=$potions"
			echo "|                            |"
			echo "+----------------------------+"
			inventory_ add 15
			space_
		elif [[ $response = 1 ]]; then
			clear
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      M               @     |"
			echo "|     -|-             -|-    |"
			echo "|----------------------------+"
			echo "| Man: Geez louise, I was    |"
			echo "| only asking a question.    |"
			echo "| Bye.                       |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| Potions=$potions"
			echo "|                            |"
			echo "+----------------------------+"
			space_
		fi
	elif [[ $1 = townperson ]]; then
		clear
		if [[ $class != 3 ]]; then
			rnum=$((RANDOM%4))
			if [[ $rnum = 0 ]]; then
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      M               @     |"
				echo "|     -|-             -|-    |"
				echo "|----------------------------+"
				echo "| Person: Watch out for the  |"
				echo "| old man.  He wanders the   |"
				echo "| wilderness.  Take all that |"
				echo "| he says with a grain of    |"
				echo "| salt, there are many who   |"
				echo "| think he is insane.        |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|                            |"
				echo "+----------------------------+"
				space_
			elif [[ $rnum = 1 ]]; then
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      M               @     |"
				echo "|     -|-             -|-    |"
				echo "|----------------------------+"
				echo "| Person: Please end the     |"
				echo "| reign of the evil shadow   |"
				echo "| knight!                    |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|                            |"
				echo "+----------------------------+"
				space_
			elif [[ $rnum = 2 ]]; then
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      M               @     |"
				echo "|     -|-             -|-    |"
				echo "|----------------------------+"
				echo "| Person: Welcome to the town|"
				echo "| of Glamrock!  Please enjoy |"
				echo "| your stay!                 |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|                            |"
				echo "+----------------------------+"
				space_
			elif [[ $rnum = 3 ]]; then
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      M               @     |"
				echo "|     -|-             -|-    |"
				echo "|----------------------------+"
				echo "| Person: Watch out for the  |"
				echo "| dwarf that roams these     |"
				echo "| parts.  He talks big, but  |"
				echo "| is awful at games.         |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|                            |"
				echo "+----------------------------+"
				space_
			fi
		else
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      M               @     |"
			echo "|     -|-             -|-    |"
			echo "|----------------------------+"
			echo "| Person: Stay out of our    |"
			echo "| town, thief!!!             |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| [ ok ]"
			echo "|                            |"
			echo "+----------------------------+"
			space_
		fi
	elif [[ $1 = dwarf ]]; then
		if [[ ${events[2]} = 0 ]]; then
			while true; do
				clear
				sel1=" "; sel2=" "; sel3=" "; sel4=" "
				vara=sel$sbase; varb=sel$(($sbase+1))
				eval $vara=\"[\"; eval $varb=\"]\"
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|                      @     |"
				echo "|     \D/             -|-    |"
				echo "|----------------------------+"
				echo "| Dwarf: Test your skill,    |"
				echo "| and you may be rewarded.   |"
				echo "| What do you say to that?   |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| $sel1 Whats the game? $sel2"
				echo "| $sel3 Get out of town, creep! $sel4"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						response=0
						break
					elif [[ $sbase = 3 ]]; then
						response=1
						break
					fi
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 3 ]]; then
					sbase=3
				fi
			done
			if [[ $response = 0 ]]; then
				while true; do
					clear
					sel1=" "; sel2=" "; sel3=" "; sel4=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo "+----------------------------+"
					echo "|                            |"
					echo "|                            |"
					echo "|                      @     |"
					echo "|     \D/             -|-    |"
					echo "|----------------------------+"
					echo "| Dwarf: A simple game of X  |"
					echo "| and O.                     |"
					echo "| Still up for a challenge?  |"
					echo "|                            |"
					echo "|                            |"
					echo "|                            |"
					echo "|----------------------------+"
					echo "| $sel1 Fine! $sel2"
					echo "| $sel3 No way! $sel4"
					echo "+----------------------------+"
					read -s -n 1 key
					audio_ click
					if [[ -n $key ]]; then
						if [[ $key = d ]] || [[ $key = s ]]; then
							((sbase=$sbase+2))
						elif [[ $key = a ]] || [[ $key = w ]]; then
							((sbase=$sbase-2))
						fi
					else
						if [[ $sbase = 1 ]]; then
							response=0
							break
						elif [[ $sbase = 3 ]]; then
							response=1
							break
						fi
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 3 ]]; then
						sbase=3
					fi
				done
			else
				clear
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|                      @     |"
				echo "|     \D/             -|-    |"
				echo "|----------------------------+"
				echo "| Dwarf: Suit yourself.      |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| "
				echo "| "
				echo "+----------------------------+"
				read -s -n 1 key
			fi
		elif [[ ${events[2]} = 1 ]] && [[ $((RANDOM%2)) = 0 ]]; then
			while true; do
				clear
				sel1=" "; sel2=" "; sel3=" "; sel4=" "
				vara=sel$sbase; varb=sel$(($sbase+1))
				eval $vara=\"[\"; eval $varb=\"]\"
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|                      @     |"
				echo "|     \D/             -|-    |"
				echo "|----------------------------+"
				echo "| Dwarf: How about a rematch?|"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| $sel1 Fine! $sel2"
				echo "| $sel3 No way! $sel4"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						response=0
						break
					elif [[ $sbase = 3 ]]; then
						response=1
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
		if [[ $response = 0 ]]; then
			ticTacToe_
			if [[ $? = 0 ]]; then
				clear
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|                      @     |"
				echo "|     \D/             -|-    |"
				echo "|----------------------------+"
				echo "| Dwarf: Fine! Cheater!      |"
				echo "| You win!                   |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| "
				echo "| "
				echo "+----------------------------+"
				space_
				audio_ chest
				loot_ c
			else
				clear
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|                      @     |"
				echo "|     \D/             -|-    |"
				echo "|----------------------------+"
				echo "| Dwarf: I knew you couldn't |"
				echo "| defeat me!                 |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| "
				echo "| "
				echo "+----------------------------+"
				space_
			fi
		else
			clear
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|                      @     |"
			echo "|     \D/             -|-    |"
			echo "|----------------------------+"
			echo "| Dwarf: Suit yourself.      |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| "
			echo "| "
			echo "+----------------------------+"
			space_
		fi
	elif [[ $1 = witch ]]; then
		if [[ ${events[4]} = 0 ]]; then
			while true; do
				clear
				sel1=" "; sel2=" "; sel3=" "; sel4=" "
				vara=sel$sbase; varb=sel$(($sbase+1))
				eval $vara=\"[\"; eval $varb=\"]\"
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      W   W           @     |"
				echo "|     -|- -|-         -|-    |"
				echo "|----------------------------+"
				echo "| Witches: Who do you think  |"
				echo "| you are, just waltzing in  |"
				echo "| like you just did!  Explain|"
				echo "| yourself.                  |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| $sel1 I go where I please! $sel2"
				echo "| $sel3 Sorry for the intrusion. $sel4"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						response=0
						break
					elif [[ $sbase = 3 ]]; then
						response=1
						break
					fi
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 3 ]]; then
					sbase=3
				fi
			done
			if [[ $response = 0 ]]; then
				clear
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      W   W           @     |"
				echo "|     -|- -|-         -|-    |"
				echo "|----------------------------+"
				echo "| Witches: We'll be the      |"
				echo "| deciders of that!!!        |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|  "
				echo "+----------------------------+"
				space_
				witchfight=true
				fight_ witch
				witchfight=false
				return 0
			elif [[ $response = 1 ]]; then
				while true; do
					clear
					sel1=" "; sel2=" "; sel3=" "; sel4=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo "+----------------------------+"
					echo "|                            |"
					echo "|                            |"
					echo "|      W   W           @     |"
					echo "|     -|- -|-         -|-    |"
					echo "|----------------------------+"
					echo "| Witches:  We forgive you...|"
					echo "| you may be of some use.    |"
					echo "| If you give us the HERB we |"
					echo "| need for our potion, we    |"
					echo "| will unlock our chests.    |"
					echo "|                            |"
					echo "|----------------------------+"
					echo "| $sel1 Not gonna happen! $sel2"
					echo "| $sel3 Deal. $sel4"
					echo "+----------------------------+"
					read -s -n 1 key
					audio_ click
					if [[ -n $key ]]; then
						if [[ $key = d ]] || [[ $key = s ]]; then
							((sbase=$sbase+2))
						elif [[ $key = a ]] || [[ $key = w ]]; then
							((sbase=$sbase-2))
						fi
					else
						if [[ $sbase = 1 ]]; then
							response=0
							break
						elif [[ $sbase = 3 ]]; then
							response=1
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
			if [[ $response = 0 ]]; then
				clear
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      W   W           @     |"
				echo "|     -|- -|-         -|-    |"
				echo "|----------------------------+"
				echo "| Witches: We'll be the      |"
				echo "| deciders of that!!!        |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|  "
				echo "+----------------------------+"
				witchfight=true
				fight_ witch
				witchfight=false
				return 0
			elif [[ $response = 1 ]]; then
				while true; do
					clear
					sel1=" "; sel2=" "; sel3=" "; sel4=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo "+----------------------------+"
					echo "|                            |"
					echo "|                            |"
					echo "|      W   W           @     |"
					echo "|     -|- -|-         -|-    |"
					echo "|----------------------------+"
					echo "| Witches: Good luck on your |"
					echo "| quest.                     |"
					echo "|                            |"
					echo "|                            |"
					echo "|                            |"
					echo "|                            |"
					echo "|----------------------------+"
					echo "| $sel1 How will I find this herb? $sel2"
					echo "| $sel3 Goodbye! $sel4"
					echo "+----------------------------+"
					read -s -n 1 key
					audio_ click
					if [[ -n $key ]]; then
						if [[ $key = d ]] || [[ $key = s ]]; then
							((sbase=$sbase+2))
						elif [[ $key = a ]] || [[ $key = w ]]; then
							((sbase=$sbase-2))
						fi
					else
						if [[ $sbase = 1 ]]; then
							clear
							echo "+----------------------------+"
							echo "|                            |"
							echo "|                            |"
							echo "|      W   W           @     |"
							echo "|     -|- -|-         -|-    |"
							echo "|----------------------------+"
							echo "| Witches: When fighting,    |"
							echo "| an enemy, some of their    |"
							echo "| evil essence may drop from |"
							echo "| their corpse.              |"
							echo "|                            |"
							echo "|                            |"
							echo "|----------------------------+"
							echo "| [ ok ]"
							echo "| "
							echo "+----------------------------+"
							space_
						elif [[ $sbase = 3 ]]; then
							events[4]=1
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
		elif [[ ${events[4]} = 1 ]]; then
			clear
			if [[ $(echo ${inv[@]} | grep 7) ]]; then
				inv=($(echo ${inv[@]} | sed 's/17/b/g' | sed 's/7/0/g' | sed 's/b/17/g'))
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      W   W           @     |"
				echo "|     -|- -|-         -|-    |"
				echo "|----------------------------+"
				echo "| Witches: Thank you!  We    |"
				echo "| will unlock our chests!    |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|  "
				echo "+----------------------------+"
				events[5]=1
				space_
			else
				clear
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      W   W           @     |"
				echo "|     -|- -|-         -|-    |"
				echo "|----------------------------+"
				echo "| Witches: You do not have   |"
				echo "| the HERB, come back when   |"
				echo "| you do!                    |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| [ ok ]"
				echo "|  "
				echo "+----------------------------+"
				space_
			fi
		elif [[ ${events[5]} = 1 ]]; then
			clear
			echo "+----------------------------+"
			echo "|                            |"
			echo "|                            |"
			echo "|      W   W           @     |"
			echo "|     -|- -|-         -|-    |"
			echo "|----------------------------+"
			echo "| Witches: Thank you!  Now   |"
			echo "| we can finally make our    |"
			echo "| potion!                    |"
			echo "|                            |"
			echo "|                            |"
			echo "|                            |"
			echo "|----------------------------+"
			echo "| [ ok ]"
			echo "|  "
			echo "+----------------------------+"
			space_
		fi
	elif [[ $1 = bar ]]; then
		if [[ -z $2 ]]; then
			CONPICK=$((RANDOM%2))
			log_ "picking conversation $CONPICK..."
			conversation_ bar $CONPICK
		elif [[ $2 = 0 ]]; then
			while true; do
				clear; sel1=" "; sel2=" "; sel3=" "; sel4=" "; vara=sel$sbase; varb=sel$(($sbase+1)); eval $vara=\"[\"; eval $varb=\"]\"
				echo -e "+----------------------------+\n|                            |\n|                            |\n|      P               @     |\n|     -|-             -|-    |\n|----------------------------+"
				echo "| Person: Watch your step!   |"
				echo "|                            |"
				echo "|                            |"
				echo -e "|                            |\n|                            |\n|                            |\n|----------------------------+"
				echo "| $sel1 Sorry. $sel2"
				echo "| $sel3 Watch yours! $sel4"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						response=0
						break
					elif [[ $sbase = 3 ]]; then
						response=1
						break
					fi
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 3 ]]; then
					sbase=3
				fi
			done
			if [[ $response = 1 ]]; then
				clear
				echo -e "+----------------------------+\n|                            |\n|                            |\n|      P               @     |\n|     -|-             -|-    |\n|----------------------------+"
				echo "| Person: Oh yeah!           |"
				echo "|                            |"
				echo "|                            |"
				echo -e "|                            |\n|                            |\n|                            |\n|----------------------------+"
				echo "|               "
				echo "|               "
				echo "+----------------------------+"
				fight_
				return 0
			fi
		elif [[ $1 = 1 ]]; then
			while true; do
				clear; sel1=" "; sel2=" "; sel3=" "; sel4=" "; vara=sel$sbase; varb=sel$(($sbase+1)); eval $vara=\"[\"; eval $varb=\"]\"
				echo -e "+----------------------------+\n|                            |\n|                            |\n|      P               @     |\n|     -|-             -|-    |\n|----------------------------+"
				echo "| Person: Can you spare a    |"
				echo "| dime?                      |"
				echo "|                            |"
				echo -e "|                            |\n|                            |\n|                            |\n|----------------------------+"
				echo "| $sel1 No. $sel2"
				echo "| $sel3 Sure. $sel4"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						response=0
						break
					elif [[ $sbase = 3 ]]; then
						response=1
						break
					fi
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 3 ]]; then
					sbase=3
				fi
			done
			if [[ $response = 1 ]]; then
				if [[ $gold -ge 10 ]]; then
					gold=$(($gold-10))
					clear
					echo -e "+----------------------------+\n|                            |\n|                            |\n|      P               @     |\n|     -|-             -|-    |\n|----------------------------+"
					echo "| Person: Thank You sir!     |"
					echo "|                            |"
					echo "|                            |"
					echo -e "|                            |\n|                            |\n|                            |\n|----------------------------+"
					echo "|               "
					echo "|               "
					echo "+----------------------------+"
					read -s -n 1
				else
					clear
					echo -e "+----------------------------+\n|                            |\n|                            |\n|      P               @     |\n|     -|-             -|-    |\n|----------------------------+"
					echo "| Person: How Dare you tease |"
					echo "| Me!                        |"
					echo "|                            |"
					echo -e "|                            |\n|                            |\n|                            |\n|----------------------------+"
					echo "|               "
					echo "|               "
					echo "+----------------------------+"
					fight_
				fi
			fi
		#elif [[ $1 = 2 ]]; then

		fi
	elif [[ $1 = powerGloveMan ]]; then
		if [[ ${events[7]} = 0 ]]; then
			while true; do
				clear
				sel1=" "; sel2=" "; sel3=" "; sel4=" "
				vara=sel$sbase; varb=sel$(($sbase+1))
				eval $vara=\"[\"; eval $varb=\"]\"
				echo "+----------------------------+"
				echo "|                            |"
				echo "|                            |"
				echo "|      P               @     |"
				echo "|     -|-             -|-    |"
				echo "|----------------------------+"
				echo "| Power Glove Man: Ha, think |"
				echo "| you can beat my high score |"
				echo "| in ball!                   |"
				echo "|                            |"
				echo "|                            |"
				echo "|                            |"
				echo "|----------------------------+"
				echo "| $sel1 Yeah! $sel2"
				echo "| $sel3 No, you're the master! $sel4"
				echo "+----------------------------+"
				read -s -n 1 key
				audio_ click
				if [[ -n $key ]]; then
					if [[ $key = d ]] || [[ $key = s ]]; then
						((sbase=$sbase+2))
					elif [[ $key = a ]] || [[ $key = w ]]; then
						((sbase=$sbase-2))
					fi
				else
					if [[ $sbase = 1 ]]; then
						response=0
						break
					elif [[ $sbase = 3 ]]; then
						response=1
						break
					fi
				fi
				if [[ $sbase -lt 1 ]]; then
					sbase=1
				elif [[ $sbase -gt 3 ]]; then
					sbase=3
				fi
			done
			if [[ $response = 0 ]]; then
				while true; do
					clear
					sel1=" "; sel2=" "; sel3=" "; sel4=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo "+----------------------------+"
					echo "|                            |"
					echo "|                            |"
					echo "|      P               @     |"
					echo "|     -|-             -|-    |"
					echo "|----------------------------+"
					echo "| Power Glove Man: Oh really?|"
					echo "| if you beat my high score, |"
					echo "| I'll give you my Power     |"
					echo "| Glove™                     |"
					echo "|                            |"
					echo "|                            |"
					echo "|----------------------------+"
					echo "| $sel1 Ok $sel2"
					echo "| $sel3 Whats the catch? $sel4"
					echo "+----------------------------+"
					read -s -n 1 key
					audio_ click
					if [[ -n $key ]]; then
						if [[ $key = d ]] || [[ $key = s ]]; then
							((sbase=$sbase+2))
						elif [[ $key = a ]] || [[ $key = w ]]; then
							((sbase=$sbase-2))
						fi
					else
						if [[ $sbase = 1 ]]; then
							response=0
							break
						elif [[ $sbase = 3 ]]; then
							response=1
							break
						fi
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 3 ]]; then
						sbase=3
					fi
				done
				while true; do
					clear
					sel1=" "; sel2=" "; sel3=" "; sel4=" "
					vara=sel$sbase; varb=sel$(($sbase+1))
					eval $vara=\"[\"; eval $varb=\"]\"
					echo "+----------------------------+"
					echo "|                            |"
					echo "|                            |"
					echo "|      P               @     |"
					echo "|     -|-             -|-    |"
					echo "|----------------------------+"
					echo "| Power Glove Man: But if I  |"
					echo "| win, you have to give me   |"
					echo "| 300 gold!                  |"
					echo "|                            |"
					echo "|                            |"
					echo "|                            |"
					echo "|----------------------------+"
					echo "| $sel1 You're on! $sel2"
					echo "| $sel3 Keep your power glove! $sel4"
					echo "+----------------------------+"
					read -s -n 1 key
					audio_ click
					if [[ -n $key ]]; then
						if [[ $key = d ]] || [[ $key = s ]]; then
							((sbase=$sbase+2))
						elif [[ $key = a ]] || [[ $key = w ]]; then
							((sbase=$sbase-2))
						fi
					else
						if [[ $sbase = 1 ]]; then
							response=0
							break
						elif [[ $sbase = 3 ]]; then
							response=1
							break
						fi
					fi
					if [[ $sbase -lt 1 ]]; then
						sbase=1
					elif [[ $sbase -gt 3 ]]; then
						sbase=3
					fi
				done
				if [[ $response = 0 ]]; then
					ballGame_
					if [[ $? = 0 ]]; then
						echo "You Lost"
						events[7]=1
					elif [[ $? = 1 ]]; then
						echo "You Won"
						events[7]=1
						events[8]=1
					fi
				fi
			fi
#		else

		fi
	fi
}