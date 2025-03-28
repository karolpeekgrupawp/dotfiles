#! /bin/sh

if ! command -v xclip &> /dev/null; then
    echo "xclip is not installed. Please install it."
    exit
fi

chosen=`cat $HOME/.kaomoji | rofi -p -dmenu | sed "s/ :.*//"`

#Exit if nothing is chosen
if [ -z "$chosen" ]; then
    exit
fi

printf "$chosen" | xclip -selection clipboard
notify-send "'$chosen' copied to clipboard." &
