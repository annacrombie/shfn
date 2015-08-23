function timeResolve_ {
	hours=$(($1/3600))
	minutes=$((($1-($hours*3600))/60))
	seconds=$(($1-(($minutes*60)+($hours*3600))))
	echo "$(printf "%02d" $hours):$(printf "%02d" $minutes):$(printf "%02d" $seconds)"
}