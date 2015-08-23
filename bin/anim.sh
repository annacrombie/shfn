function anim_ {
	if [[ $1 = e ]]; then
		if [[ $2 = f ]]; then
			if [[ $level != moon ]] && [[ $level != crater ]]; then
				audio_ en
			fi
		elif [[ $2 = fo ]]; then
			if [[ $level != moon ]] && [[ $level != crater ]]; then
				audio_ $level
			fi
		else
			audio_ ed
		fi
		for ((i=0;i<30;i++)); do
			for ((j=0;j<16;j++)); do
				tput cup $j $i
				echo -n "#####"
				if [[ $aSpeed = slow ]]; then
					sleep 0.004
				fi
			done
			((i++))
			((i++))
			((i++))
			((i++))
		done
	elif [[ $1 = ft ]]; then
		audio_ hit; tput cup 5 6; echo -n "#"; tput cup 7 9; echo -n "#"; sleep 0.1; tput cup 5 6; echo -n " "; tput cup 7 9; echo -n " "; sleep 0.1; tput cup 5 6; echo -n "#"; tput cup 7 9; echo -n "#"; sleep 0.1; tput cup 5 6; echo -n " "; tput cup 7 9; echo -n " "; sleep 0.1
	elif [[ $1 = fy ]]; then
		audio_ hit; tput cup 5 21; echo -n "#"; tput cup 7 24; echo -n "#"; sleep 0.1; tput cup 5 21; echo -n " "; tput cup 7 24; echo -n " "; sleep 0.1; tput cup 5 21; echo -n "#"; tput cup 7 24; echo -n "#"; sleep 0.1; tput cup 5 21; echo -n " "; tput cup 7 24; echo -n " "; sleep 0.1
	elif [[ $1 = openingCutscene ]]; then
		for ((q=0;q<15;q++)); do
			randomTerrain_ force
			clear
			echo "${random0[0]}${random0[1]}${random0[2]}${random0[3]}${random0[4]}${random0[5]}${random0[6]}${random0[7]}${random0[8]}${random0[9]}${random0[10]}${random0[11]}${random0[12]}${random0[13]}${random0[14]}${random0[15]}${random0[16]}${random0[17]}${random0[18]}${random0[19]}${random0[20]}${random0[21]}${random0[22]}${random0[23]}${random0[24]}${random0[25]}${random0[26]}${random0[27]}${random0[28]}${random0[29]}"
			echo "${random1[0]}${random1[1]}${random1[2]}${random1[3]}${random1[4]}${random1[5]}${random1[6]}${random1[7]}${random1[8]}${random1[9]}${random1[10]}${random1[11]}${random1[12]}${random1[13]}${random1[14]}${random1[15]}${random1[16]}${random1[17]}${random1[18]}${random1[19]}${random1[20]}${random1[21]}${random1[22]}${random1[23]}${random1[24]}${random1[25]}${random1[26]}${random1[27]}${random1[28]}${random1[29]}"
			echo "${random2[0]}${random2[1]}${random2[2]}${random2[3]}${random2[4]}${random2[5]}${random2[6]}${random2[7]}${random2[8]}${random2[9]}${random2[10]}${random2[11]}${random2[12]}${random2[13]}${random2[14]}${random2[15]}${random2[16]}${random2[17]}${random2[18]}${random2[19]}${random2[20]}${random2[21]}${random2[22]}${random2[23]}${random2[24]}${random2[25]}${random2[26]}${random2[27]}${random2[28]}${random2[29]}"
			echo "${random3[0]}${random3[1]}${random3[2]}${random3[3]}${random3[4]}${random3[5]}${random3[6]}${random3[7]}${random3[8]}${random3[9]}${random3[10]}${random3[11]}${random3[12]}${random3[13]}${random3[14]}${random3[15]}${random3[16]}${random3[17]}${random3[18]}${random3[19]}${random3[20]}${random3[21]}${random3[22]}${random3[23]}${random3[24]}${random3[25]}${random3[26]}${random3[27]}${random3[28]}${random3[29]}"
			echo "${random4[0]}${random4[1]}${random4[2]}${random4[3]}${random4[4]}${random4[5]}${random4[6]}${random4[7]}${random4[8]}${random4[9]}${random4[10]}${random4[11]}${random4[12]}${random4[13]}${random4[14]}${random4[15]}${random4[16]}${random4[17]}${random4[18]}${random4[19]}${random4[20]}${random4[21]}${random4[22]}${random4[23]}${random4[24]}${random4[25]}${random4[26]}${random4[27]}${random4[28]}${random4[29]}"
			echo "${random5[0]}${random5[1]}${random5[2]}${random5[3]}${random5[4]}${random5[5]}${random5[6]}${random5[7]}${random5[8]}${random5[9]}${random5[10]}${random5[11]}${random5[12]}${random5[13]}${random5[14]}${random5[15]}${random5[16]}${random5[17]}${random5[18]}${random5[19]}${random5[20]}${random5[21]}${random5[22]}${random5[23]}${random5[24]}${random5[25]}${random5[26]}${random5[27]}${random5[28]}${random5[29]}"
			echo "${random6[0]}${random6[1]}${random6[2]}${random6[3]}${random6[4]}${random6[5]}${random6[6]}${random6[7]}${random6[8]}${random6[9]}${random6[10]}${random6[11]}${random6[12]}${random6[13]}${random6[14]}${random6[15]}${random6[16]}${random6[17]}${random6[18]}${random6[19]}${random6[20]}${random6[21]}${random6[22]}${random6[23]}${random6[24]}${random6[25]}${random6[26]}${random6[27]}${random6[28]}${random6[29]}"
			echo "${random7[0]}${random7[1]}${random7[2]}${random7[3]}${random7[4]}${random7[5]}${random7[6]}${random7[7]}${random7[8]}${random7[9]}${random7[10]}${random7[11]}${random7[12]}${random7[13]}${random7[14]}${random7[15]}${random7[16]}${random7[17]}${random7[18]}${random7[19]}${random7[20]}${random7[21]}${random7[22]}${random7[23]}${random7[24]}${random7[25]}${random7[26]}${random7[27]}${random7[28]}${random7[29]}"
			echo "${random8[0]}${random8[1]}${random8[2]}${random8[3]}${random8[4]}${random8[5]}${random8[6]}${random8[7]}${random8[8]}${random8[9]}${random8[10]}${random8[11]}${random8[12]}${random8[13]}${random8[14]}${random8[15]}${random8[16]}${random8[17]}${random8[18]}${random8[19]}${random8[20]}${random8[21]}${random8[22]}${random8[23]}${random8[24]}${random8[25]}${random8[26]}${random8[27]}${random8[28]}${random8[29]}"
			echo "${random9[0]}${random9[1]}${random9[2]}${random9[3]}${random9[4]}${random9[5]}${random9[6]}${random9[7]}${random9[8]}${random9[9]}${random9[10]}${random9[11]}${random9[12]}${random9[13]}${random9[14]}${random9[15]}${random9[16]}${random9[17]}${random9[18]}${random9[19]}${random9[20]}${random9[21]}${random9[22]}${random9[23]}${random9[24]}${random9[25]}${random9[26]}${random9[27]}${random9[28]}${random9[29]}"
			echo "${random10[0]}${random10[1]}${random10[2]}${random10[3]}${random10[4]}${random10[5]}${random10[6]}${random10[7]}${random10[8]}${random10[9]}${random10[10]}${random10[11]}${random10[12]}${random10[13]}${random10[14]}${random10[15]}${random10[16]}${random10[17]}${random10[18]}${random10[19]}${random10[20]}${random10[21]}${random10[22]}${random10[23]}${random10[24]}${random10[25]}${random10[26]}${random10[27]}${random10[28]}${random10[29]}"
			echo "${random11[0]}${random11[1]}${random11[2]}${random11[3]}${random11[4]}${random11[5]}${random11[6]}${random11[7]}${random11[8]}${random11[9]}${random11[10]}${random11[11]}${random11[12]}${random11[13]}${random11[14]}${random11[15]}${random11[16]}${random11[17]}${random11[18]}${random11[19]}${random11[20]}${random11[21]}${random11[22]}${random11[23]}${random11[24]}${random11[25]}${random11[26]}${random11[27]}${random11[28]}${random11[29]}"
			echo "${random12[0]}${random12[1]}${random12[2]}${random12[3]}${random12[4]}${random12[5]}${random12[6]}${random12[7]}${random12[8]}${random12[9]}${random12[10]}${random12[11]}${random12[12]}${random12[13]}${random12[14]}${random12[15]}${random12[16]}${random12[17]}${random12[18]}${random12[19]}${random12[20]}${random12[21]}${random12[22]}${random12[23]}${random12[24]}${random12[25]}${random12[26]}${random12[27]}${random12[28]}${random12[29]}"
			echo "${random13[0]}${random13[1]}${random13[2]}${random13[3]}${random13[4]}${random13[5]}${random13[6]}${random13[7]}${random13[8]}${random13[9]}${random13[10]}${random13[11]}${random13[12]}${random13[13]}${random13[14]}${random13[15]}${random13[16]}${random13[17]}${random13[18]}${random13[19]}${random13[20]}${random13[21]}${random13[22]}${random13[23]}${random13[24]}${random13[25]}${random13[26]}${random13[27]}${random13[28]}${random13[29]}"
			echo "${random14[0]}${random14[1]}${random14[2]}${random14[3]}${random14[4]}${random14[5]}${random14[6]}${random14[7]}${random14[8]}${random14[9]}${random14[10]}${random14[11]}${random14[12]}${random14[13]}${random14[14]}${random14[15]}${random14[16]}${random14[17]}${random14[18]}${random14[19]}${random14[20]}${random14[21]}${random14[22]}${random14[23]}${random14[24]}${random14[25]}${random14[26]}${random14[27]}${random14[28]}${random14[29]}"
			echo "${random15[0]}${random15[1]}${random15[2]}${random15[3]}${random15[4]}${random15[5]}${random15[6]}${random15[7]}${random15[8]}${random15[9]}${random15[10]}${random15[11]}${random15[12]}${random15[13]}${random15[14]}${random15[15]}${random15[16]}${random15[17]}${random15[18]}${random15[19]}${random15[20]}${random15[21]}${random15[22]}${random15[23]}${random15[24]}${random15[25]}${random15[26]}${random15[27]}${random15[28]}${random15[29]}"
		done
	fi
}