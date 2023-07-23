function places_emoji --description "Displays emoji based on present working directory if available"
    # additional directories can be added in similar way
    switch $PWD
        case ~
	    echo -n 🏠
	case ~/Documents
	    echo -n 📄
	# emojis which are combinations of multiple emojis are to be
	# appended with space therefore quotes are used 
	case ~/Downloads
	    echo -n "⬇️ "
	case ~/Music
	    echo -n 🎵
	case ~/Pictures
	    echo -n 📷
	case ~/Videos
	    echo -n 🎬
	#case ~/Desktop
	#    echo -n "🖥️ "
    end
end
