wallpath=~/Pictures/Wallpapers/hide-forest.jpg

for monitor in $(hyprctl monitors | grep 'Monitor' | awk '{ print $2 }'); do
	hyprctl hyprpaper preload $wallpath
	hyprctl hyprpaper wallpaper $monitor,$wallpath
done
