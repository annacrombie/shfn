function audio_ {
	if [[ $music = on ]]; then
		if [[ $1 = stop ]]; then
			if [[ $(ps aux | grep mplayer | grep -v grep | awk '{print $2}') ]]; then
				kill $(ps aux | grep mplayer | grep -v grep | awk '{print $2}') 2>/dev/null
			fi
		elif [[ $1 = town ]]; then
			audio_ stop
			mplayer -loop 0 ./audio/theme/house.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = tavern ]]; then
			audio_ stop
			mplayer -loop 0 ./audio/theme/house.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = rtown ]]; then
			audio_ stop
			mplayer -loop 0 ./audio/theme/house.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = house ]]; then
			audio_ stop
			mplayer -loop 0 ./audio/theme/house.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = castle ]]; then
			audio_ stop
			mplayer -loop 0 ./audio/theme/castle.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = prison ]]; then
			audio_ stop
			mplayer -loop 0 ./audio/theme/house.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = title ]]; then
			audio_ stop
			mplayer -volume 10 -loop 0 ./audio/theme/title.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = moon ]]; then
			audio_ stop
			if [[ $(for ((i=0;i<${#moonScatNames[@]};i++)); do if [[ $name = ${moonScatNames[$i]} ]]; then echo "1"; break; fi; done) = 1 ]]; then
				mplayer -volume 100 -loop 0 ./audio/theme/moonscat.ogg >/dev/null 2>/dev/null&
			else
				mplayer -volume 100 -loop 0 ./audio/theme/moon.ogg >/dev/null 2>/dev/null&
			fi
		elif [[ $1 = crater ]]; then
			audio_ stop
			if [[ $(for ((i=0;i<${#moonScatNames[@]};i++)); do if [[ $name = ${moonScatNames[$i]} ]]; then echo "1"; break; fi; done) = 1 ]]; then
				mplayer -volume 100 -loop 0 ./audio/theme/moonscat.ogg >/dev/null 2>/dev/null&
			else
				mplayer -volume 100 -loop 0 ./audio/theme/moon.ogg >/dev/null 2>/dev/null&
			fi
		elif [[ $1 = overworld ]]; then
			audio_ stop
			if [[ $2 = first ]]; then
				mplayer -volume 80 ./audio/theme/ov_intro.ogg >/dev/null 2>/dev/null&&mplayer -loop 0 -volume 80 ./audio/theme/ov.ogg >/dev/null 2>/dev/null&
			else
				mplayer -loop 0 -volume 80 ./audio/theme/ov.ogg >/dev/null 2>/dev/null&
			fi
		elif [[ $1 = random ]]; then
			audio_ stop
			mplayer -loop 0 -volume 80 ./audio/theme/ov.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = fight ]]; then
			audio_ stop
			mplayer -volume 80 ./audio/theme/battle_intro.ogg >/dev/null 2>/dev/null&&mplayer -loop 0 -volume 80 ./audio/theme/battle.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = ed ]]; then
			mplayer ./audio/fx/ed.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = en ]]; then
			audio_ stop
			mplayer -volume 80 ./audio/fx/encounter.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = hit ]]; then
			mplayer -volume 80 ./audio/fx/hit/hit$((RANDOM%3)).ogg >/dev/null 2>/dev/null&
		elif [[ $1 = beep ]]; then
			mplayer -volume 80 ./audio/fx/beep/beep$((RANDOM%4)).ogg >/dev/null 2>/dev/null&
		elif [[ $1 = chest ]]; then
			mplayer ./audio/fx/chest.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = walk ]]; then
			mplayer ./audio/fx/walk.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = win ]]; then
			mplayer ./audio/fx/win.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = click ]]; then
			mplayer ./audio/fx/click.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = fanfare ]]; then
			audio_ stop
			mplayer -volume 80 ./audio/fx/fanfare.ogg >/dev/null 2>/dev/null&
		elif [[ $1 = inception ]]; then
			audio_ stop
			mplayer -volume 80 ./audio/fx/inception.ogg >/dev/null 2>/dev/null&
		fi
	fi
}