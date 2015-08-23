function console_ {
	echo "Console:"
	while true; do
		read -p ">>> " key
		if [[ -n $key ]]; then
			if [[ $key = clear ]]; then
				clear
			elif [[ $key = reload ]] || [[ $key = r ]]; then
				bash $script -c
			elif [[ $key = x ]]; then
				break
			elif [[ $(echo $key | grep echo) ]]; then
				var=$(echo $key | awk '{$1=""; print}')
				echo $var

			else
				$(echo $key | awk '{print $1}' | sed 's/_//g')_ $(echo $key | awk '{$1=""; print}')
			fi
		fi
	done
}