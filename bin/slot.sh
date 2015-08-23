function slot_ {
	if [[ -f ./save/sav$1 ]]; then
		cat ./save/sav$1 | grep $2 | awk '{print $2}'
	else
		echo "empty"
	fi
}