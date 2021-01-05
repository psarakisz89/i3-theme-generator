#!/bin/sh

#bash/zsh aliases
DIR=$(pwd)

#i3 config
echo "LINKING: $DIR/.config/i3/config-> ~/.config/i3/config "
ln -nfs $DIR/.config/i3/config ~/.config/i3/config
#i3 layouts
echo "LINKING: $DIR/.config/i3/chromium.json-> ~/.config/i3/chromium.json "
ln -nfs $DIR/.config/i3/chromium.json ~/.config/i3/chromium.json
echo "LINKING: $DIR/.config/i3/4terminals.json-> ~/.config/i3/4terminals.json "
ln -nfs $DIR/.config/i3/4terminals.json ~/.config/i3/4terminals.json
echo "LINKING: $DIR/.config/i3/open_terminals.sh-> ~/.config/i3/open_terminals.sh "
ln -nfs $DIR/.config/i3/open_terminals.sh ~/.config/i3/open_terminals.sh
#i3 primary display selector
echo "LINKING: $DIR/.config/i3/primary_display_selector.sh-> ~/.config/i3/primary_display_selector.sh "
ln -nfs $DIR/.config/i3/primary_display_selector.sh ~/.config/i3/primary_display_selector.sh

#compton
echo "LINKING: $DIR/.config/compton.conf-> ~/.config/compton.conf "
ln -nfs $DIR/.config/compton.conf ~/.config/compton.conf

#bumblebee-theme
echo "LINKING: $DIR/.config/bumblebee-status/themes/custom-theme-powerline.json-> ~/.config/bumblebee-status/themes/custom-theme-powerline.json "
ln -nfs $DIR/.config/bumblebee-status/themes/custom-theme-powerline.json ~/.config/bumblebee-status/themes/custom-theme-powerline.json

#rofi
echo "LINKING: $DIR/.config/rofi/config-> ~/.config/rofi/config "
ln -nfs $DIR/.config/rofi/config ~/.config/rofi/config

echo "LINKING: $DIR/.config/rofi/theme.rasi-> ~/.config/rofi/theme.rasi "
ln -nfs $DIR/.config/rofi/theme.rasi ~/.config/rofi/theme.rasi

#dunst
echo "LINKING: $DIR/.config/dunst/dunstrc-> ~/.config/dunst/dunstrc "
ln -nfs $DIR/.config/dunst/dunstrc ~/.config/dunst/dunstrc

#kitty setup
echo "LINKING: $DIR/.config/kitty/kitty.conf -> ~/.config/kitty/kitty.conf "
ln -nfs $DIR/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

#wallpaper
echo "COPYING: $DIR/.config/wallpaper/spawn1.jpg-> ~/.config/wallpaper/theme_wallpaper.jpg "
mkdir -p ~/.config/wallpaper && cp $DIR/.config/wallpaper/purple2.jpg ~/.config/wallpaper/theme_wallpaper.jpg
echo "SETTING Theme Wallpaper"
feh --bg-scale ~/.config/wallpaper/theme_wallpaper.jpg