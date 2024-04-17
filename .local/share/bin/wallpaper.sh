if [ -z "$1" ];then
	echo "Path image missing!"
	exit 1
fi

dirWall=~/Pictures/Wallpapers/
wallpath=$dirWall/$1

for monitor in $(hyprctl monitors | grep 'Monitor' | awk '{ print $2 }'); do
	hyprctl hyprpaper preload $wallpath
	hyprctl hyprpaper wallpaper $monitor,$wallpath
done
