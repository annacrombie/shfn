function damage_ {
	if [[ $1 = you ]]; then
		if [[ $spellused = true ]]; then
			ydd=$spellDamage
			eHealth=$(($eHealth-$ydd))
			yddd="$ydd damage"
			fightScreen_ you
			anim_ ft
			sleep 0.3
			spellused=false
		else
			if [[ $potionused != true ]]; then
				tddd=""
				if [[ $ydd != miss ]]; then
					local oldYdd=$ydd
					local rEMDefense=$((${enemy[2]}/5*3))
					local rEDefense=$((RANDOM%$rEMDefense))
					ydd=$(($ydd-$((RANDOM%(${enemy[2]}/5*3)))))
					log_ "Your Damage (2): ( ydd($oldYdd) - rDef($rEDefense [ out of $rEMDefense ]) = $ydd"
					if [[ $ydd -gt 0 ]]; then
						eHealth=$(($eHealth-$ydd))
						yddd="$ydd damage"
						if [[ $((RANDOM%2)) = 0 ]] && [[ $(echo ${inv[@]} | grep 8) ]]; then
							lifeStolen=$((RANDOM%$ydd))
							hp=$(($hp+$lifeStolen))
							if [[ $hp -gt $mp ]]; then
								hp=$mp
							fi
							echo "Stole $(($ydd/2)) life"
						fi
					else
						ydd=1
						yddd=1
						eHealth=$(($eHealth-$ydd))
					fi
				else
					yddd=miss
				fi
				fightScreen_ you
				anim_ ft
				sleep 0.3
			else
				potionused=false
			fi
		fi
	elif [[ $1 = them ]]; then
		yddd=""
		if [[ $tdd != miss ]]; then
			local oldTdd=$tdd
			if [[ $(echo ${inv[@]} | grep 24) ]]; then
				local maxDefense=$(($defense+${invd[${inv[1]}]}+${invd[24]}))
			elif [[ $(echo ${inv[@]} | grep 26) ]]; then
				local maxDefense=$(($defense+${invd[${inv[1]}]}+${invd[26]}))
			else
				local maxDefense=$(($defense+${invd[${inv[1]}]}))
			fi
			local randomDefense=$((RANDOM%$maxDefense))
			tdd=$(($tdd-$randomDefense))
			log_ "Their Damage (2): ( tdd($oldTdd) - rDef($randomDefense [ out of $defense + ${invd[${inv[1]}]} ($maxDefense) ]) = $tdd"
			if [[ $tdd -gt 0 ]]; then
				hp=$(($hp-$tdd))
				tddd="$tdd damage"
			else
				tdd=1
				tddd=1
				hp=$(($hp-$tdd))
			fi	
		else
			tddd=miss
		fi
		fightScreen_ them
		if [[ $((RANDOM%10)) = 0 ]] && [[ ${enemy[7]} = 1 ]]; then
			effect_ a 1
		fi
		anim_ fy
		sleep 0.3
	fi
	effect_ c
}