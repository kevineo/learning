echo "Mac User, Sublime Version:"
OPTIONS="sublime2 sublime3"
select opt in $OPTIONS; do
	case $opt in
	"sublime2")
		echo "alias subl=\"/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl\"" >>  ~/.bash_profile
		break
		;;
	"sublime3")
		echo "alias subl=\"/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl\"" >>  ~/.bash_profile
		break
		;;
	*)
		echo "Invalid Option"
		;;
	esac
done
