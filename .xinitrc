# start window manager
exec i3

# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#pick a random wallpaper
feh --randomize --bg-fill ~/.wallpaper/*
