function launch_ {
	log_ ini
	title=true
	developer=false
	script=$0
	printf "\e]0;-=[Island Fantasy]=-\007"
	if [[ -n $* ]]; then
		while [[ -n $* ]]; do
			if [[ $1 = -r ]]; then
				reset_
			elif [[ $1 = -l ]]; then
				doLog=true
				shift
			elif [[ $1 = -lf ]]; then
				if [[ -d $(dirname $2) ]]; then
					logFile=$2
				fi
				shift 2
			elif [[ $1 = -t ]]; then
				title=false
			elif [[ $1 = -c ]]; then
				console_
			elif [[ $1 = -d ]]; then
				developer=true
				shift
			fi
		done
	fi
	mkdir -p ./save
	ini_ first
	log_ first
	if [[ ! -f ./settings ]]; then
		save_ settings
	fi
	if [[ ! -f ./stats ]]; then
		stats_ reset
		stats_ save
	fi
	stats_ load
	load_ settings
	clear
	if [[ $title = true ]]; then
		title_
	fi
	save_
	ini_ class
	clear
	load_
	if [[ -f ./save/terrain$saveSlot ]]; then
		load_ terrain
	fi
	SECONDS=$(cat ./stats | grep time | awk '{print $2}')
	log_ "Time: $SECONDS"
	posCorrect_
	map_
	main_
}