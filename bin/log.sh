function log_ {
	if [[ $1 = ini ]]; then
		logFile=./game.log
		doLog=false
	else
		if [[ $doLog = true ]]; then
			if [[ $1 = position ]]; then
				echo "x = $x | y = $y" >> $logFile
			elif [[ $1 = first ]]; then
				echo "game initiated; logging to $logFile ($(date))"
			else
				echo "$*" >> $logFile
			fi
		fi
	fi
}