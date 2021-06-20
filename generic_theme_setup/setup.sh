#!/bin/sh

#bash/zsh aliases
DIR=$(pwd)

#i3 config
echo "LINKING: $DIR/.config/i3/config-> ~/.config/i3/config "
ln -nfs $DIR/.config/i3/config ~/.config/i3/config
#i3 layouts
echo "LINKING: $DIR/.config/i3/browser.json-> ~/.config/i3/browser.json "
ln -nfs $DIR/.config/i3/browser.json ~/.config/i3/browser.json
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

#zshrc
echo "LINKING: $DIR/.zshrc -> ~/.zshrc"
ln -nfs $DIR/.zshrc ~/.zshrc

#bashrc
echo "LINKING: $DIR/.bashrc -> ~/.bashrc"
ln -nfs $DIR/.bashrc ~/.bashrc

#NVIM
echo "LINKING: $DIR/.config/nvim/init.lua -> ~/.config/init.lua"
ln -nfs $DIR/.config/nvim/init.lua ~/.config/nvim/init.lua

#NVIM LUA FILES
ln -nfs $DIR/.config/nvim/lua/compe-completion.lua ~/.config/nvim/lua/compe-completion.lua
ln -nfs $DIR/.config/nvim/lua/custom_highlights.lua ~/.config/nvim/lua/custom_highlights.lua
ln -nfs $DIR/.config/nvim/lua/file-icons.lua ~/.config/nvim/lua/file-icons.lua
ln -nfs $DIR/.config/nvim/lua/gitsigns-nvim.lua ~/.config/nvim/lua/gitsigns-nvim.lua
ln -nfs $DIR/.config/nvim/lua/mappings.lua ~/.config/nvim/lua/mappings.lua
ln -nfs $DIR/.config/nvim/lua/misc-utils.lua ~/.config/nvim/lua/misc-utils.lua
ln -nfs $DIR/.config/nvim/lua/nvim-lspconfig.lua ~/.config/nvim/lua/nvim-lspconfig.lua
ln -nfs $DIR/.config/nvim/lua/nvimTree.lua ~/.config/nvim/lua/nvimTree.lua
ln -nfs $DIR/.config/nvim/lua/pluginList.lua ~/.config/nvim/lua/pluginList.lua
ln -nfs $DIR/.config/nvim/lua/statusline.lua ~/.config/nvim/lua/statusline.lua
ln -nfs $DIR/.config/nvim/lua/telescope-nvim.lua ~/.config/nvim/lua/telescope-nvim.lua
ln -nfs $DIR/.config/nvim/lua/top-bufferline.lua ~/.config/nvim/lua/top-bufferline.lua
ln -nfs $DIR/.config/nvim/lua/treesitter-nvim.lua ~/.config/nvim/lua/treesitter-nvim.lua
ln -nfs $DIR/.config/nvim/lua/whichkey.lua ~/.config/nvim/lua/whichkey.lua

#wallpaper
echo "COPYING: $DIR/.config/wallpaper/spawn1.jpg-> ~/.config/wallpaper/theme_wallpaper.jpg "
mkdir -p ~/.config/wallpaper && cp $DIR/.config/wallpaper/purple2.jpg ~/.config/wallpaper/theme_wallpaper.jpg
echo "SETTING Theme Wallpaper"
feh --bg-scale ~/.config/wallpaper/theme_wallpaper.jpg
