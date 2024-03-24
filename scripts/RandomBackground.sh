wallpapersDir="$HOME/Pictures/Wallpapers"
wallpapers=("$wallpapersDir"/*.png)

wallpaperIndex=$((RANDOM % ${#wallpapers[@]}))
selectedWallpaper=${wallpapers[$wallpaperIndex]}
echo $selectedWallpaper
swww img "$selectedWallpaper" --transition-type any --transition-fps 90 --transition-duration 5
