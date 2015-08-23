function ini_ {
	if [[ $1 = first ]]; then
		saveSlot=0
		music=on
		aSpeed=fast
		moved=false
		lastfight=99
		drinksHad=0
		statDisplay=false
		encounterEnemies=true
		avatar='@'
		moonScatNames=("Howard" "Vince" "Scat" "Boosh" "Moon" "Naboo" "Bollo")
		#        0          1                2       3
		spelln=("Fireball" "Lightning Bolt" "Storm" "Fire Storm")
		spellc=("1"        "3"              "7"     "13"        )
		spellp=("50"       "100"            "400"   "1000"      )
		spellintelect=("0" "150"            "300"   "550"       )
		spellUnlock=("1"   "0"              "0"     "0"         )
		#dont forget to change for book keeper!!!!!!
		#        0     1        2       3        4              5        6               7      8                 9                       10          11             12           13       14                15     16       17         18            19      20     21      22        23            24             25            26
		invl=("empty" "Dagger" "Sword" "Hammer" "Silver Sword" "Armour" "Silver Armour" "HERB" "LifeSteal Amulet" "Enchanted Spectacles" "Moon Shard" "Regen Amulet" "Prison Key" "Magnet" "Camouflage"      "Book" "Cheese" "Antidote" "Mana Potion" "Totem" "Mead" "Wine"  "Whiskey" "Town Scroll" "Iron Mask" "Power Glove" "Iron Fist")
		prices=("0"   "50"     "300"   "650"    "4000"         "70"     "4000"          "0"    "0"                "1500"                 "2000"       "1200"         "0"          "1000"   "1000"            "0"    "500"    "150"      "150"         "0"     "25"   "50"    "75"      "100"         "0"            "0"           "0"           )
		minAgi=("0"   "0"      "50"    "100"    "150"          "0"      "0"             "0"    "0"                "0"                    "0"          "0"            "0"          "0"      "0"               "0"    "0"      "0"        "0"           "0"     "0"    "0"     "0"       "0"           "0"            "0"           "0"           )
		invp=(  "0"   "20"     "35"    "45"     "200"          "0"      "0"             "0"    "0"                "0"                    "0"          "0"            "0"          "0"      "0"               "0"    "0"      "0"        "0"           "0"     "0"    "0"     "0"       "0"           "100"          "0"           "100"         )
		invd=(  "0"   "0"      "0"     "0"      "20"           "20"     "200"           "0"    "0"                "0"                    "0"          "0"            "0"          "0"      "0"               "0"    "0"      "0"        "0"           "0"     "0"    "0"     "0"       "0"           "0"            "100"         "100"         )
		#         0         1             2      3
		classes=("Fighter" "Book Keeper" "Mage" "Theif")
		drops=("9" "10" "11" "13" "14")
		class=0
		lvl=1
		level=overworld
		x=5
		y=3
		potions=1
		gold=200
		xp=0
		boss=0
		berryName=("empty" "Red" "Purple" "Green" "Blue")
		berryEffect=("x" "x" "x" "x" "x")
		berryInventory=("0" "0" "0" "0")
		cheese=("0" "0" "0" "0" "0" "0")
		chest=("0" "0" "0" "0" "0")
		owned=("0" "0" "0" "0")
		bOwned=("0" "0" "0" "0")
		lives=3
		inv=("0" "0" "0" "0")
		bank=("0" "0" "0" "0")
		effects=("0" "0" "0" "0")
		effectd=("0" "0" "0" "0")
		effectn=("Fertata" "Poison" "Drunk" "Alcohol Poisioning")
		invMagic=("0" "0" "0" "0")
		magicPoints=0
		mmagicPoints=0
		#        0   1   2   3   4   5   6   7   8
		events=("0" "0" "0" "0" "0" "0" "0" "0" "0")
	elif [[ $1 = class ]]; then
		if [[ $class = 0 ]]; then #fighter
			mpMod=10
			powerMod=13
			agilityMod=7
			defenseMod=10
			intelectMod=0
			magicMod=0
			if [[ $2 = first ]]; then
				mp=120
				mpFirst=120
				power=50
				powerFirst=50
				agility=25
				agilityFirst=25
				defense=20
				defenseFirst=20
				intelect=0
				intelectFirst=0
				luck=0
				luckFirst=0
				magicPoints=0
				magicPointsFirst=0
				mmagicPoints=0
				mmagicPointsFirst=0
			fi
		elif [[ $class = 1 ]]; then #book keeper
			prices=("0"   "50"     "300"   "650"    "4000"         "70"     "4000"          "0"    "0"                "1500"                 "2000"       "1200"         "0"          "1000"   "1000"            "0"    "500"    "150"      "150"         "0"     "25"   "50"    "75"      "100"         "0"            "0"           "0"           )
			prices=("0"   "25"     "150"   "325"    "2000"         "35"     "2000"          "0"    "0"                "1500"                 "2000"       "1200"         "0"          "1000"   "1000"            "0"    "500"    "75"       "75"          "0"     "25"   "50"    "75"      "50"          "0"            "0"           "0"           ) #half off for all shop items
			mpMod=15
			powerMod=5
			agilityMod=5
			defenseMod=5
			magicMod=1
			intelectMod=20
			if [[ $2 = first ]]; then
				mp=95
				mpFirst=95
				power=25
				powerFirst=25
				agility=5
				agilityFirst=5
				defense=35
				defenseFirst=35
				intelect=60
				intelectFirst=60
				luck=0
				luckFirst=0
				magicPoints=2
				magicPointsFirst=2
				mmagicPoints=2
				mmagicPointsFirst=2
				inv=("0" "0" "9" "0")
			fi
		elif [[ $class = 2 ]]; then #mage
			mpMod=12
			powerMod=8
			agilityMod=7
			defenseMod=8
			magicMod=1
			intelectMod=15
			if [[ $2 = first ]]; then
				mp=105
				mpFirst=105
				power=25
				powerFirst=25
				agility=15
				agilityFirst=15
				defense=35
				defenseFirst=35
				intelect=40
				intelectFirst=40
				luck=0
				luckFirst=0
				magicPoints=2
				magicPointsFirst=2
				mmagicPoints=2
				mmagicPointsFirst=2
			fi
		elif [[ $class = 3 ]]; then #thief
			mpMod=14
			powerMod=11
			agilityMod=20
			defenseMod=5
			magicMod=0
			intelectMod=0
			if [[ $2 = first ]]; then
				mp=105
				mpFirst=105
				power=45
				powerFirst=45
				agility=45
				agilityFirst=45
				defense=25
				defenseFirst=25
				intelect=0
				intelectFirst=0
				luck=10
				luckFirst=10
				magicPoints=0
				magicPointsFirst=0
				mmagicPoints=0
				mmagicPointsFirst=0
			fi
		fi
		hp=$mp
	elif [[ $1 = reset ]]; then
		if [[ $difficulty = 0 ]]; then
			level=overworld
			x=5
			y=3
			hp=$mp
			magicPoints=$mmagicPoints
			effectd=("1" "1" "1" "1")
		elif [[ $difficulty = 1 ]]; then
			level=overworld
			x=5
			y=3
			inv=("0" "0" "0" "0")
			hp=$mp
			magicPoints=$mmagicPoints
			effectd=("1" "1" "1" "1")
		elif [[ $difficulty = 2 ]]; then
			lvl=1
			level=overworld
			x=5
			y=3
			agility=$agilityFirst
			power=$powerFirst
			defense=$defenseFirst
			mp=$mpFirst
			mmagicPoints=$mmagicPointsFirst
			hp=$mp
			magicPoints=$mmagicPoints
			potions=1
			xp=0
			inv=("0" "0" "0" "0")
			effectd=("1" "1" "1" "1")
		fi
	fi
}