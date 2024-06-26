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

#dunst
echo "LINKING: $DIR/.config/dunst/dunstrc-> ~/.config/dunst/dunstrc "
ln -nfs $DIR/.config/dunst/dunstrc ~/.config/dunst/dunstrc

#zshrc
echo "LINKING: $DIR/.zshrc -> ~/.zshrc"
ln -nfs $DIR/.zshrc ~/.zshrc

#bashrc
echo "LINKING: $DIR/.bashrc -> ~/.bashrc"
ln -nfs $DIR/.bashrc ~/.bashrc
