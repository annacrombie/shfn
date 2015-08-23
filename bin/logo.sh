function logo_ {
	if [[ $(tput cols) -ge 76 ]]; then
		echo '#####  ###  #      #   #   # ####    ####   #   #   # #####   #    ###  #  #'
		echo '  #   #     #     # #  ##  # #   #   #     # #  ##  #   #    # #  #     #  #'
		echo '  #    ###  #    #   # # # # #   #   ###  #   # # # #   #   #   #  ###   ###'
		echo '  #       # #    ##### #  ## #   #   #    ##### #  ##   #   #####     #    #'
		echo '#####  ###  #### #   # #   # ####    #    #   # #   #   #   #   #  ###   ## '
	elif [[ $(tput cols) -ge 39 ]]; then
		echo '  #####  ###  #      #   #   # #### '
		echo '    #   #     #     # #  ##  # #   #'
		echo '    #    ###  #    #   # # # # #   #'
		echo '    #       # #    ##### #  ## #   #'
		echo '  #####  ###  #### #   # #   # #### '
		echo ''
		echo '####   #   #   # #####   #    ###  #  #'
		echo '#     # #  ##  #   #    # #  #     #  #'
		echo '###  #   # # # #   #   #   #  ###   ###'
		echo '#    ##### #  ##   #   #####     #    #'
		echo '#    #   # #   #   #   #   #  ###   ## '
	elif [[ $(tput cols) -ge 30 ]]; then
		echo "ISLAND FANTASY"
	else
		while [[ $(tput cols) -lt 35 ]] || [[ $(tput lines) -lt 20 ]]; do
			echo -en "\rPlease resize your window to at least 35X20 (Current: $(tput cols)X$(tput lines))"
		done
		clear
		title_
	fi
}