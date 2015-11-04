echo "Mac User, Sublime Version:"
OPTIONS="sublime2 sublime3"
select opt in $OPTIONS; do
	case $opt in
	"sublime2")
		ln -s "/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
		break
		;;
	"sublime3")
		break
		;;
	*)
		echo "Invalid Option"
		;;
	esac
done
